










// POLYMORPHIC PATTERNS

    // Store Polymorphic Data
        // different fields or data types


    // Inheritance Pattern
        // documents are mostly similar

        // The inheritance pattern uses a parent entity with common fields 
        // to group child entities that have variable forms.

    // MongoDB uses a flexible data model, which means documents in a single collection 
    // do not need to have the same structure. 

    // Polymorphic data is data in a single collection that varies in document fields or data types.


    // mongosh prints nested objects up to six levels deep
        // config.set("inspectDepth", Infinity)

// ==================================================================================================== //



// SCHEMA VALIDATION

    // create validation rules for your fields

    // flexible schema model

    // no unintended schema changes
    // improper data types


    // ----------------------------------------------------------------


    // When to Use Schema Validation

        // schema validation needs depend on how users use your application

        // password - string


    // ----------------------------------------------------------------


    // When MongoDB Checks Validation

        // All document inserts must match the rules.
        // Defines how the rules are applied to existing documents and document updates. 

    
    // ----------------------------------------------------------------


    // What Happens When a Document Fails Validation

        // rejects the operation
        // does not write the document to the collection

        // you can configure MongoDB to allow invalid documents and 
        // log warnings when schema violations occur


    // ----------------------------------------------------------------

    // Validation Level

        // strict
            // all document inserts and updates

            db.runCommand( {
                collMod: "contacts",
                validator: { $jsonSchema: {
                   bsonType: "object",
                   required: [ "phone", "name" ],
                   properties: {
                      phone: {
                         bsonType: "string",
                         description: "phone must be a string and is required"
                      },
                      name: {
                         bsonType: "string",
                         description: "name must be a string and is required"
                      }
                   }
                } },
                validationLevel: "strict"
            } )

        // moderate
            // document inserts and updates to existing valid documents that match the validation rules

            db.runCommand( {
                collMod: "contacts",
                validator: { $jsonSchema: {
                   bsonType: "object",
                   required: [ "phone", "name" ],
                   properties: {
                      phone: {
                         bsonType: "string",
                         description: "phone must be a string and is required"
                      },
                      name: {
                         bsonType: "string",
                         description: "name must be a string and is required"
                      }
                   }
                } },
                validationLevel: "moderate"
             } )


    // Validation Actions

        // error: Rejects invalid inserts/updates (strict enforcement).
        // warn: Logs issues but allows operations (flexible).

    // ----------------------------------------------------------------        


    // Specify JSON Schema Validation

        // can't specify schema validation fo
            // Collections in the admin, local, and config databases

        //   
            // Client-Side Field Level Encryption
            // Queryable Encryption

            // Create a collection with validation.
            db.createCollection("students", {
                validator: {
                   $jsonSchema: {
                      bsonType: "object",
                      title: "Student Object Validation",
                      required: [ "address", "major", "name", "year" ],
                      properties: {
                         name: {
                            bsonType: "string",
                            description: "'name' must be a string and is required"
                         },
                         year: {
                            bsonType: "int",
                            minimum: 2017,
                            maximum: 3017,
                            description: "'year' must be an integer in [ 2017, 3017 ] and is required"
                         },
                         gpa: {
                            bsonType: [ "double" ],
                            description: "'gpa' must be a double if the field exists"
                         }
                      }
                   }
                }
            } )

            // Insert invalid documents
            db.students.insertOne( {
                name: "Alice",
                year: Int32( 2019 ),
                major: "History",
                gpa: Int32(3),
                address: {
                   city: "NYC",
                   street: "33rd Street"
                }
            } )

            // Insert a valid document
            db.students.insertOne( {
                name: "Alice",
                year: NumberInt(2019),
                major: "History",
                gpa: Double(3.0),
                address: {
                   city: "NYC",
                   street: "33rd Street"
                }
            } )

            // Query operator validation.
            db.createCollection("sales", {
                validator: {
                  "$and": [
                    // Validation with query operators
                    {
                      "$expr": {
                        "$lt": ["$lineItems.discountedPrice", "$lineItems.price"]
                      }
                    },
                    // Validation with JSON Schema
                    {
                      "$jsonSchema": {
                        "properties": {
                          "items": { "bsonType": "array" }
                        }
                       }
                     }
                   ]
                 }
               }
            )


    // ---------------------------------------------------------------------------------------


    // Specify Validation With Query Operators
        
        // using query operators such as $eq and $gt to compare fields.

        // to create dynamic validation rules that compare multiple field values at runtime

        // can't specify the following query operators in a validator object
            // $expr with $function expressions
            // $near
            // $nearSphere
            // $text
            // $where

        // Create a collection with op validation
        db.createCollection( "orders",
            {
                validator: {
                    $expr:
                        {
                        $eq: [
                            "$totalWithVAT",
                            { $multiply: [ "$total", { $sum:[ 1, "$VAT" ] } ] }
                        ]
                        }
                }
            }
        )

        // Insert invalid documents
        db.orders.insertOne( {
            total: NumberDecimal("141"),
            VAT: NumberDecimal("0.20"),
            totalWithVAT: NumberDecimal("169")
        } )

        // Insert valid documents
        db.orders.insertOne( {
            total: NumberDecimal("141"),
            VAT: NumberDecimal("0.20"),
            totalWithVAT: NumberDecimal("169.2")
         } )



    // Specify Allowed Field Values

        // what values are allowed in a particular field

        // enum - enumerate

        // Create a collection with validation containing enum
        db.createCollection("shipping", {
            validator: {
               $jsonSchema: {
                  bsonType: "object",
                  title: "Shipping Country Validation",
                  properties: {
                     country: {
                        enum: [ "France", "United Kingdom", "United States" ],
                        description: "Must be either France, United Kingdom, or United States"
                     }
                  }
               }
            }
        } )

        // Insert invalid documents
        db.shipping.insertOne( {
            item: "sweater",
            size: "medium",
            country: "Germany"
        } )

        // Insert valid documents
        db.shipping.insertOne( {
            item: "sweater",
            size: "medium",
            country: "France"
        } )


    // -----------------------------------------------------------------------------------


    // View Existing Validation Rules
        // You can view a collection's validation rules to determine 
        // what restrictions are imposed on documents and 
        // how MongoDB handles invalid documents when they occur.

        // db.getCollectionInfos()
            db.getCollectionInfos( { name: "students" } )[0].options.validator
            // Validation Action and Level Not Included by Default if not explicitly set

        // listCollections
            db.runCommand ( { listCollections: 1, filter: { name: "students" } } )


    // -----------------------------------------------------------------------------------


    // Modify Schema Validation
        
        // can modify validation rules at any time

        // collMod 
            // add validation to an existing collection that was not created with validation.

        // Create a collection with validation
        db.createCollection("users", {
            validator: {
               $jsonSchema: {
                  bsonType: "object",
                  required: [ "username", "password" ],
                  properties: {
                     username: {
                        bsonType: "string",
                        description: "must be a string and is required"
                     },
                     password: {
                        bsonType: "string",
                        minLength: 8,
                        description: "must be a string at least 8 characters long, and is required"
                     }
                  }
               }
            }
        } )

        // Modify the validation schema
        db.runCommand( { collMod: "users",
            validator: {
               $jsonSchema: {
                  bsonType: "object",
                  required: [ "username", "password" ],
                  properties: {
                     username: {
                        bsonType: "string",
                        description: "must be a string and is required"
                     },
                     password: {
                        bsonType: "string",
                        minLength: 12,
                        description: "must be a string of at least 12 characters, and is required"
                     }
                  }
               }
            }
        } )

        // Insert a invalid Document
        db.users.insertOne(
            {
               "username": "salesAdmin01",
               "password": "kT9$j4wg#M"
            }
         )
        
        db.users.insertOne(
            {
                "username": "salesAdmin02",
                "password": "i8U60*VyL8"
            }
        )

        // Insert a Valid Document
        db.users.insertOne(
            {
               "username": "salesAdmin01",
               "password": "8p&SQd7T90$KKx"
            }
        )
    

    // ------------------------------------------------------------------------------------


    // Query for and Modify Valid or Invalid Documents
        
        // Match the Schema
        db.inventory.find(myschema)
        db.inventory.aggregate( [ { $match: myschema } ] )
        
        // Don't Match the Schema
        db.inventory.find( { $nor: [ myschema ] } )

        // Update Documents that Don't Match the Schema
        db.inventory.updateMany(
            {
               $nor: [ myschema ]
            },
            {
               $set: { isValid: false }
            }
         )
        
        // Delete Documents that Don't Match the Schema
        db.inventory.deleteMany( { $nor: [ myschema ] } )


    // Bypass Schema Validation

        // Bypassing schema validation is done on a per-operation basis

        // If you bypass schema validation to insert an invalid document, 
        // any future updates to the invalid document must either:

            // Also bypass schema validation
            // Result in a valid document
        
        // Bypassing Supported Operations

            // applyOps command

            // findAndModify command and db.collection.findAndModify() method
        
            // mapReduce command and db.collection.mapReduce() method
        
            // insert command
        
            // update command
        
            // $out and $merge stages for the aggregate command and db.collection.aggregate() method

        // Create a collection with validation rules
        db.createCollection("students", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    required: [ "name", "year", "major", "address" ],
                    properties: {
                        name: {
                        bsonType: "string",
                        description: "must be a string and is required"
                        },
                        year: {
                        bsonType: "int",
                        minimum: 2017,
                        maximum: 3017,
                        description: "must be an integer in [ 2017, 3017 ] and is required"
                        }
                    }
                }
            }
        } )

        // 

        db.runCommand( {
            insert: "students",
            documents: [
               {
                  name: "Alice",
                  year: Int32( 2016 ),
                  major: "History",
                  gpa: Double(3.0),
                  address: {
                     city: "NYC",
                     street: "33rd Street"
                  }
               }
            ],
        } )

        db.runCommand( {
            insert: "students",
            documents: [
               {
                  name: "Alice",
                  year: Int32( 2016 ),
                  major: "History",
                  gpa: Double(3.0),
                  address: {
                     city: "NYC",
                     street: "33rd Street"
                  }
               }
            ],
            bypassDocumentValidation: true
        } )



