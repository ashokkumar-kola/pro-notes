


// =================================================================================== //



// Aggregation Operations


    // process multiple documents 
    // return computed results


    // Group values from multiple documents together
    // Perform operations on the grouped data to return a single result
    // Analyze data changes over time


    // 
        // Aggregation pipelines
        // Single purpose aggregation methods


    // Why Use Aggregation Pipelines?
        // Filtering & Shaping Data	        $match, $project
        // Grouping & Summarizing	        $group, $sum, $avg
        // Joining Collections	            $lookup (like SQL JOIN)
        // Data Transformation	            $addFields, $replaceRoot
        // Handling Arrays	                $unwind, $filter, $map
        // Pagination & Sorting	            $skip, $limit, $sort



// =================================================================================== //



// AGGREGATION PIPELINES 

    // Pipeline Structure:
        // Consists of one or more stages executed in sequence.
        // Each stage processes input documents and passes results to the next stage.

        // filter documents, group documents, calculate values


    // Aggregate Method
        db.collection.aggregate() 
        // aggregate Method do not modify 
        // Unless pipeline contains $merge and $out
        // Returns a cursor (streamable result set)


    // Aggregate pipeline Syntex
        db.collection.aggregate([
            // stage 1

            { $stageOperator: {} }

            // stage 2

            // ......

            // stage N
        ])
    

    // EXAMPLE:
        db.collection.aggregate([
            { $match: { ... } },      // Stage 1: Filter documents
            { $group: { ... } },      // Stage 2: Group documents
            { $sort: { ... } }        // Stage 3: Sort results
        ])



// =================================================================================== //



// STAGES : Input as Document --> Performs Operation  -->  Outputs Documents

    // Stages are Independent

    // Within []

    // Stage starts from stage operator
        //  { $<stageOperator> : {} }

    // Aggregate pipeline is combination of stages i.e everything inside []

    // Max 100 Stages 

    // stage op can appear multiple times in a pipeline
        // Yes == stages names
        // No  == $out, $merge, $geoNear, $changeStream, $changeStreamSplitLargeEvent

    // Stages Types
        // Stages that works on db.collection.aggregate()  
            // 

        // Stages that works on db.aggregate() 
            // $changeStream, $currentOp, $documents, $listLocalSessions
            
        // Stages available for update
            // findAndModify
                db.collection.findOneAndUpdate()
                db.collection.findAndModify()

            // update
                db.collection.updateOne()
                db.collection.updateMany()
                Bulk.find.update()
                Bulk.find.updateOne()
                Bulk.find.upsert()

            // $addFields and its alias $set

            // $project and its alias $unset

            // $replaceRoot and its alias $replaceWith

        // STAGE OPERATORS
            // $match
            // $group
            // $project
            // $sort
            // $count
            // $limit
            // $skip
            // $out


        // 
        db.collection.aggregate( [] ) == db.collection.find( {} )



// 📁 A. Filtering Stages
// ----------------------

    // $match      → Filters documents (like WHERE in SQL)

    // Example:
        db.collection.aggregate([{ $match: { status: "active" } }])


    // -------------------------------------------------------------------


    // $limit      → Limits number of documents

    // Example:
        db.collection.aggregate([{ $limit: 10 }])


    // -------------------------------------------------------------------


    // $skip       → Skips first N documents

    // Example:
        db.collection.aggregate([{ $skip: 5 }])




// 📁 B. Grouping & Reshaping
// --------------------------

    // $group      → Groups documents by a field
    // Example:
        db.collection.aggregate([{ $group: { _id: "$category", total: { $sum: "$price" } } }])


    // -------------------------------------------------------------------


    // $project    → Selects specific fields (like SELECT in SQL)
    Example:
        db.collection.aggregate([{ $project: { name: 1, price: 1 } }])

        db.collection.aggregate([{
            $project: {
              discountEligible: {
                $cond: {
                  if: { $gte: ["$totalSpent", 1000] },
                  then: true,
                  else: false
                }
              }
            }
        }])


    // -------------------------------------------------------------------


    // $addFields  → Adds new computed fields
    // Example:
        db.collection.aggregate([{ $addFields: { discountPrice: { $multiply: ["$price", 0.9] } } }])



// 📁 C. Array & Nested Data Handling
// ---------------------------------

    // $unwind     → Flattens arrays, one document per element

    // Example:
        db.collection.aggregate([{ $unwind: "$tags" }])


    // -------------------------------------------------------------------


    // $filter     → Filters elements in an array

    // Example:
        db.collection.aggregate([{
        $addFields: {
            expensiveItems: {
            $filter: {
                input: "$items",
                as: "item",
                cond: { $gt: ["$$item.price", 10] }
            }
            }
        }
        }])



// 📁 D. Joining Collections ($lookup)
// ----------------------------------

    // $lookup     → Performs a left outer join with another collection

    // Example:
        db.collection.aggregate([{
        $lookup: {
            from: "authors",
            localField: "authorId",
            foreignField: "_id",
            as: "authorDetails"
        }
        }])



// 📁 E. Output Stages
// -------------------

    // $out        → Writes result to a new collection (replaces it)

    // Example:
        db.collection.aggregate([{ $out: "reportResults" }])


    // -------------------------------------------------------------------


    // $merge      → Merges result into an existing collection

    // Example:
        db.collection.aggregate([{
        $merge: {
            into: "reports",
            on: "_id",
            whenMatched: "merge",
            whenNotMatched: "insert"
        }
        }])
   


// Performance Considerations














// MATCH

	db.persons.aggregate([
		{ $match: {gender: 'female'} },
		{ $group: {_id: {eyeColor: "$eyeColor", age: "$age"} } }
	])

	// Wrong Order: 0 results
	db.persons.aggregate([
		{ $group: {_id: {eyeColor: "$eyeColor", age: "$age"} } },
		{ $match: {gender: 'female'} },
	])

    db.persons.aggregate([
		{ $group: {_id: {eyeColor: "$eyeColor", age: "$age"} } },
		{ $match: {"_id.eyeColor": 'blue' } },
	])

	db.persons.aggregate([
		{ $group: {_id: {eyeColor: "$eyeColor", age: "$age"} } },
		{ $match: {"_id.age": {$gt: 30} } },
	])



// COUNT - $count

    // Syntex
        { $count: "<title>" }

    // Server-side Count - It will not return any documents
        // Object
        db.persons.aggregate([
            { $count: "allDocumentsCount" }       // 0.21 sec
        ])
        // number
        db.persons.find({}).count()  // count() is wrapper of aggregate $count

    // Client-Side Count - returns documents
        db.persons.aggregate([]).toArray().length  // 1.7 sec
        db.persons.aggregate([]).itcount()         // 1.4 sec



    db.persons.aggregate([])



// SORT - $sort

    // Order
        // match => group => sort

    // Syntex
        // { $sort: { <field1>: < -1 | 1 >, ... } }
        // 1 - Ascending
        // -1 - Descending

    db.persons.aggregate([
        { $sort: {name: 1} }
    ])

    db.persons.aggregate([
        { $sort: {name: 1, age: 1} }
    ])



// PROJECT - $project

    // Syntex
        // { $project: { _id: < 1 | 0> , <field2>: 0, <newField>: <expression>, ... } }

    // Order

    // Filters 
        // Every Document

    db.persons.aggregate([
        { $project: { _id: 1, age: 0} }
    ])

    db.persons.aggregate([
        { $project: { _id: 1, age: 0} }
    ])

    db.persons.aggregate([
        { $project: { isActive: 1, name: 1, FullName: "$name" } }
    ])
    
    db.persons.aggregate([
        { $project: { 
            _id: 0, 
            name: 1, 
            info: {
                eyes: "$eyeColor",
                fruit: "$favoriteFruit",
                country: "$company.location.country"
            } 
        } }
    ])


// LIMIT - $limit

    // Syntex
        // { $count: <number> }

    // Order
        // first stage
        // last stage

    // Cases
        // $limit as first stage
        // after $sort to produce topN results 


// UNWIND - $unwind

    // Definition
        // Splits each document with specified array to several documents - one document per array element

    // Group by arrays


    // Syntex
        // { $unwind: <arrayReferenceExpression> }

    // Order
        // first stage
        // last stage


    // Examples

    db.persons.aggregate([
        { $unwind: "$tags" },
        { $project: {name:1, gender:1, tags:1} }
    ])

    db.persons.aggregate([
        { $unwind: "$tags" },
        { $group: { _id: "$tags" } }
    ])



// SPECIAL OPERATORS
// ACCUMULATORS

    // Most accumulators are used in group stage

    // Accumulators maintain state for each group of the documents

    // $sum
    // $avg
    // $max
    // $min

    { $accu}

    db.persons.aggregate([
        { $group: {
            _id: "$age",
            count: { $sum: 1 }
        } }
    ])

    db.persons.aggregate([
        { $unwind: "$tags" },
        { $group: {
            _id: "$tags",
            count: { $sum: 1 }
        } }
    ])


// UNARY OP

// type
// lt or gt and multiply

// usually used in project stage
// In group stage unary op can be used only in conjunction with accumulators


// OUT

    // must be last stage
    // If output collection does not exist, it will be created automatically



// allowDiskUse



// All aggregation stages can use maximum 100MB of RAM
//  server return error if exceeds RAM limit

// allow MongoDb to write stages data to the temporal files 
{ allowDiskUse: true }


db.persons.aggregate([], { allowDiskUse: true })




    // Definition

    // Order

    // Syntex

    // Example



// ADDFIELDS - $addFields

    // Definition
        // Adds new fields to documents
        // Outputs documents existing fields and newly added fields


    // Order


    // Similarities
        // $addFields equivalent $project
        // $set alias for $addFields


    // Syntex
        { $addFields: { newField: expression, ... } }


    // Cases
        // If name is same as an existing field name
            // overwrites the existing value

        // 

        // Can Include multiple $addFields stages

        // accepts the embedding of objects

        // Remove Fields - $$REMOVE
            { $addFields: { fieldName: "$$REMOVE" } }

            { $addFields: { 
                fieldName: { 
                $ifNull: [ "$fieldName", "$$REMOVE" ] 
            } 
            } }


    // Example
        db.scores.aggregate( [
            {
                $addFields: {
                    totalHomework: { $sum: "$homework" } ,
                    totalQuiz: { $sum: "$quiz" }
                }
            },
            {
                $addFields: { totalScore:
                    { $add: [ "$totalHomework", "$totalQuiz", "$extraCredit" ] } }
            },
            {
                $addFields: { date: "$$REMOVE" }
            }
        ] )












// Single Purpose Aggregation Methods

// The single purpose aggregation methods aggregate documents from a single collection. 
// The methods are simple but lack the capabilities of an aggregation pipeline. 

db.collection.estimatedDocumentCount()
// Returns an approximate count of the documents in a collection or a view.

db.collection.count()
// Returns a count of the number of documents in a collection or a view.

db.collection.distinct()
// Returns an array of documents that have distinct values for the specified field.















