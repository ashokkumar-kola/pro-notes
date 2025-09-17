// ========================================================================================================== // 


// 📘 Primitives & Type Assignment


// Primitives

    // 3 Main Primitive Types

        // boolean – Represents true or false values
            let isDone: boolean = true;

        // number – Whole numbers and floating-point values
            let score: number = 42.5;

        // string – Text values
            let message: string = "TypeScript Rocks";



    // 2 Less Common Primitive Types

        // bigint – For very large integers
            let bigNum: bigint = 9007199254740991n;
        
        // symbol – Unique identifiers
            const uniqueKey = Symbol("id");


// ========================================================================================================== // 



// Type Assignment

    // Explicit Type Assignment
        let isActive: boolean;
        isActive = false;

    // Implicit Type Assignment
        let age = 30; // TypeScript infers 'number'
        age = 25;     // Valid
        age = "25";   // Error: Type 'string' is not assignable to type 'number'


// Error in Type Assignment

    // Type 'string' is not assignable to type 'number'
        let count: number;
        count = "10"; // Error: Type 'string' is not assignable to type 'number'

    // Type 'undefined' is not assignable to type 'number'
        let total: number;
        total = undefined; // Error: Type 'undefined' is not assignable to type 'number'


// Unable to Infer

    const json = JSON.parse("55");       // Type inferred as 'any'
    console.log(typeof json);            // ➞ number

    // Sometimes TypeScript **cannot infer** the correct type and defaults to `any`
    // `any` disables type checking and can be dangerous in large codebases.


// `noImplicitAny` in `tsconfig.json`

    // Setting `noImplicitAny` to true in `tsconfig.json` forces explicit type annotations
    // This helps catch potential errors early in the development process.

    {
        "compilerOptions": {
            "noImplicitAny": true
        }
    }

    // Example of `noImplicitAny` in action
        let result; // Error: Variable 'result' implicitly has an 'any' type.
        result = 42;



// ========================================================================================================== // 



// TypeScript Special Types

    // special types that may not refer to any specific type of data.

    // Type: any

        // Represents any type of value
            let data: any;
            data = 42;          // number
            data = "Hello";     // string
            data = true;       // boolean
            data = [1, 2, 3];  // array
            data = { key: "value" }; // object
            data = null;       // null
            data = undefined;  // undefined
            data = Symbol("id"); // symbol
            data = 9007199254740991n; // bigint
            data = function() {}; // function
            data = new Date(); // Date object
            data = new Map(); // Map object
            data = new Set(); // Set object


    // Type: unknown

        let w: unknown = 1;
        w = "string"; // no error
        w = {
        runANonExistentMethod: () => {
            console.log("I think therefore I am");
        }
        } as { runANonExistentMethod: () => void}
        // How can we avoid the error for the code commented out below when we don't know the type?
        // w.runANonExistentMethod(); // Error: Object is of type 'unknown'.
        if(typeof w === 'object' && w !== null) {
        (w as { runANonExistentMethod: Function }).runANonExistentMethod();
        }
        // Although we have to cast multiple times we can do a check in the if to secure our type and have a safer casting 

    
    // Type: never
        
        // never effectively throws an error whenever it is defined.
        
        let x: never = true; // Error: Type 'boolean' is not assignable to type 'never'. 

        // never is rarely used, especially by itself, its primary use is in advanced generics.

    
    // Type: undefined & null
        
        // undefined and null are subtypes of all other types.
        // This means that you can assign undefined and null to any type, but not the other way around.
        
        let u: undefined = undefined; // valid
        let n: null = null; // valid

        let s: string = undefined; // Error: Type 'undefined' is not assignable to type 'string'.
        let b: boolean = null; // Error: Type 'null' is not assignable to type 'boolean'.

        // These types don't have much use unless strictNullChecks is enabled in the tsconfig.json file. 


// ========================================================================================================== // 



// TypeScript Arrays

    // Arrays are a collection of values of the same type.
    // You can define an array using the Array<T> syntax or the shorthand T[] syntax.

        // Using Array<T> syntax
            let numbers: Array<number> = [1, 2, 3, 4, 5]; 

        // Using shorthand T[] syntax
            let fruits: string[] = ["apple", "banana", "orange"];

        // Mixed types in an array
            let mixedArray: (number | string)[] = [1, "two", 3, "four"];

        // Readonly arrays
            let readonlyArray: ReadonlyArray<number> = [1, 2, 3];
            // readonlyArray[0] = 10; // Error: Index signature in type 'readonly number[]' only permits reading.

    // Type Inference
        const numbers = [1, 2, 3]; // inferred to type number[]
        numbers.push(4); // no error
        // comment line below out to see the successful assignment
        numbers.push("2"); // Error: Argument of type 'string' is not assignable to parameter of type 'number'.
        let head: number = numbers[0]; // no error



// ========================================================================================================== // 


    
// TypeScript Tuples

    // Tuples are fixed-length arrays with specific types for each element.
    // You can define a tuple using the [T1, T2, ...] syntax.

        // Example of a tuple
            let person: [string, number] = ["Alice", 30];

        // Accessing tuple elements
            let name: string = person[0]; // "Alice"
            let age: number = person[1]; // 30

        // Tuples with optional elements
            let point: [number, number?] = [10]; // valid
            point[1] = 20; // valid

        // Readonly Tuple
            const ourReadonlyTuple: readonly [number, boolean, string] = [5, true, 'The Real Coding God'];
            ourReadonlyTuple.push('Coding God took a day off'); // Error: Property 'push' does not exist on type 'readonly [number, boolean, string]'.


    // Named Tuples
        const graph: [x: number, y: number] = [55.2, 41.3];

    // Destructuring Tuples
        const graph: [number, number] = [55.2, 41.3];
        const [x, y] = graph;



// ========================================================================================================== // 



// TypeScript Object Types

    const car: { type: string, model: string, year: number } = {
        type: "Toyota",
        model: "Corolla",
        year: 2009
    };

    // Accessing object properties
        const carType: string = car.type; // "Toyota"
        const carModel: string = car.model; // "Corolla"
        const carYear: number = car.year; // 2009

    // Type Inference
        const car = {
            type: "Toyota",
        };
        car.type = "Ford"; // no error
        car.type = 2; // Error: Type 'number' is not assignable to type 'string'.

    // Optional Properties
        const car: { type: string, mileage?: number } = { // no error
            type: "Toyota"
        };
        car.mileage = 2000;

    // Index Signatures
        // Index signatures can be used for objects without a defined list of properties.
        const nameAgeMap: { [index: string]: number } = {};
        nameAgeMap.Jack = 25; // no error
        nameAgeMap.Mark = "Fifty"; // Error: Type 'string' is not assignable to type 'number'. 



// ========================================================================================================== // 



// TypeScript Enums

        // Numeric Enums - Default
            enum CardinalDirections {
                North,
                East,
                South,
                West
            }
            let currentDirection = CardinalDirections.North;

        // Numeric Enums - Initialized
            enum CardinalDirections {
                North = 1,
                East,
                South,
                West
            }
            console.log(CardinalDirections.North);

        // Numeric Enums - Fully Initialized
            enum StatusCodes {
                NotFound = 404,
                Success = 200,
                Accepted = 202,
                BadRequest = 400
            }
            console.log(StatusCodes.NotFound);

        // String Enums
            enum CardinalDirections {
                North = 'North',
                East = "East",
                South = "South",
                West = "West"
            };
            console.log(CardinalDirections.North);



// ========================================================================================================== // 


    
// TypeScript Type Aliases and Interfaces


// Type Aliases

    // Type Aliases allow defining types with a custom name (an Alias).
    // Type Aliases can be used for primitives like string or more complex types such as objects and arrays

    type CarYear = number
    type CarType = string
    type CarModel = string
    type Car = {
        year: CarYear,
        type: CarType,
        model: CarModel
    }

    const carYear: CarYear = 2001
    const carType: CarType = "Toyota"
    const carModel: CarModel = "Corolla"
    const car: Car = {
        year: carYear,
        type: carType,
        model: carModel
    };


// Interfaces

    // Interfaces are similar to type aliases, except they only apply to object types.

    interface Rectangle {
        height: number,
        width: number
    }
    
    const rectangle: Rectangle = {
        height: 20,
        width: 10
    };

// Extending Interfaces

    // Extending an interface means you are creating a new interface 
    // with the same properties as the original, plus something new.

    interface Rectangle {
        height: number,
        width: number
    }
    
    interface ColoredRectangle extends Rectangle {
        color: string
    }
    
    const coloredRectangle: ColoredRectangle = {
        height: 20,
        width: 10,
        color: "red"
    };



// ========================================================================================================== // 



// TypeScript Union Types

    // Union types are used when a value can be more than a single type.
    // Such as when a property would be string or number.

    // Union | (OR)

        // Using the | we are saying our parameter is a string or number:

            function printStatusCode(code: string | number) {
                console.log(`My status code is ${code}.`)
            }
            printStatusCode(404);
            printStatusCode('404');


    // Union Type Errors

        function printStatusCode(code: string | number) {
            console.log(`My status code is ${code.toUpperCase()}.`) 
            // error: Property 'toUpperCase' does not exist ontype 'string | number'.
            // Property 'toUpperCase' does not exist on type 'number'
        }



// ========================================================================================================== // 



// TypeScript Functions

    // Return Type
        // the `: number` here specifies that this function returns a number
        function getTime(): number {
            return new Date().getTime();
        }

        // If no return type is defined, TypeScript will attempt to infer it through 
        // the types of the variables or expressions returned.


    // Void Return Type
        function printHello(): void {
            console.log('Hello!');
        }


    // Parameters
        function multiply(a: number, b: number) {
            return a * b;
        }

        // If no parameter type is defined, TypeScript will default to using any, 
        // unless additional type information is available as shown in the Default Parameters 
        // and Type Alias sections below.


    // Optional Parameters
        function add(a: number, b: number, c?: number) {
            return a + b + (c || 0);
        }


    // Default Parameters
        function pow(value: number, exponent: number = 10) {
            return value ** exponent;
        }


    // Named Parameters
        function divide({ dividend, divisor }: { dividend: number, divisor: number }) {
            return dividend / divisor;
        }

    // Rest Parameters
        function add(a: number, b: number, ...rest: number[]) {
            return a + b + rest.reduce((p, c) => p + c, 0);
        }

    // Type Alias
        type Negate = (value: number) => number;
        // in this function, the parameter `value` automatically gets assigned the type `number` from the type `Negate`
        const negateFunction: Negate = (value) => value * -1;



// ========================================================================================================== // 



// TypeScript Casting

    // Casting with as
        let x: unknown = 'hello';
        console.log((x as string).length);

    // Casting doesn't actually change the type of the data within the variable, 
    // for example the following code will not work as expected since the variable x is still holds a number.
    let x: unknown = 4;
    console.log((x as string).length); // prints undefined since numbers don't have a length 


    // Casting with <>
        let x: unknown = 'hello';
        console.log((<string>x).length);
        // This type of casting will not work with TSX, such as when working on React files. 


    // Force casting
        let x = 'hello';
        console.log(((x as unknown) as number).length); // x is not actually a number so this will return undefined 



// ========================================================================================================== // 



// TypeScript Classes
    
    // TypeScript adds types and visibility modifiers to JavaScript classes.

    // Members: Types
        class Person {
            name: string;
        }
        
        const person = new Person();
        person.name = "Jane";


    // Members: Visibility
        // public    - (default) allows access to the class member from anywhere
        // private   - only allows access to the class member from within the class
        // protected - allows access to the class member from itself and any classes that inherit it, which is covered in the inheritance section below

        class Person {
            private name: string;
            
            public constructor(name: string) {
                this.name = name;
            }
            
            public getName(): string {
                return this.name;
            }
        }
        
        const person = new Person("Jane");
        console.log(person.getName()); // person.name isn't accessible from outside the class since it's private


    // Parameter Properties
        class Person {
            // name is a private member variable
            public constructor(private name: string) {}
        
            public getName(): string {
            return this.name;
            }
        }
        
        const person = new Person("Jane");
        console.log(person.getName());


    // Readonly
        class Person {
            private readonly name: string;
        
            public constructor(name: string) {
            // name cannot be changed after this initial definition, which has to be either at it's declaration or in the constructor.
            this.name = name;
            }
        
            public getName(): string {
            return this.name;
            }
        }
        
        const person = new Person("Jane");
        console.log(person.getName());


    // Inheritance: Implements
        interface Shape {
            getArea: () => number;
        }
        
        class Rectangle implements Shape {
            public constructor(protected readonly width: number, protected readonly height: number) {}
        
            public getArea(): number {
            return this.width * this.height;
            }
        }

        // class Rectangle implements Shape, Colored // implement multiple interfaces


    // Inheritance: Extends
        interface Shape {
            getArea: () => number;
        }
        
        class Rectangle implements Shape {
            public constructor(protected readonly width: number, protected readonly height: number) {}
        
            public getArea(): number {
            return this.width * this.height;
            }
        }
        
        class Square extends Rectangle {
            public constructor(width: number) {
            super(width, width);
            }
        
            // getArea gets inherited from Rectangle
        }

    // Override
        interface Shape {
            getArea: () => number;
        }
        
        class Rectangle implements Shape {
            // using protected for these members allows access from classes that extend from this class, such as Square
            public constructor(protected readonly width: number, protected readonly height: number) {}
        
            public getArea(): number {
            return this.width * this.height;
            }
        
            public toString(): string {
            return `Rectangle[width=${this.width}, height=${this.height}]`;
            }
        }
        
        class Square extends Rectangle {
            public constructor(width: number) {
            super(width, width);
            }
        
            // this toString replaces the toString from Rectangle
            public override toString(): string {
            return `Square[width=${this.width}]`;
            }
        }

        // By default the override keyword is optional when overriding a method, 
        // and only helps to prevent accidentally overriding a method that does not exist. 
        // Use the setting noImplicitOverride to force it to be used when overriding. 


    // Abstract Classes
        abstract class Polygon {
            public abstract getArea(): number;
        
            public toString(): string {
            return `Polygon[area=${this.getArea()}]`;
            }
        }
        
        class Rectangle extends Polygon {
            public constructor(protected readonly width: number, protected readonly height: number) {
            super();
            }
        
            public getArea(): number {
            return this.width * this.height;
            }
        }

        // Abstract classes cannot be directly instantiated, as they do not have all their members implemented. 



// ========================================================================================================== // 



// TypeScript Basic Generics
    // Generics allow creating 'type variables' which can be used to create classes, 
    // functions & type aliases that don't need to explicitly define the types that they use.

    // Functions
        function createPair<S, T>(v1: S, v2: T): [S, T] {
            return [v1, v2];
        }
        console.log(createPair<string, number>('hello', 42)); // ['hello', 42]

    // TypeScript can also infer the type of the generic parameter from the function parameters. 

    // Classes
        class NamedValue<T> {
            private _value: T | undefined;
        
            constructor(private name: string) {}
        
            public setValue(value: T) {
            this._value = value;
            }
        
            public getValue(): T | undefined {
            return this._value;
            }
        
            public toString(): string {
            return `${this.name}: ${this._value}`;
            }
        }
        
        let value = new NamedValue<number>('myNumber');
        value.setValue(10);
        console.log(value.toString()); // myNumber: 10


    // Type Aliases

        type Wrapped<T> = { value: T };

        const wrappedValue: Wrapped<number> = { value: 10 };


        // This also works with interfaces with the following syntax: interface Wrapped<T> 


    // Default Value
        class NamedValue<T = string> {
            private _value: T | undefined;
        
            constructor(private name: string) {}
        
            public setValue(value: T) {
            this._value = value;
            }
        
            public getValue(): T | undefined {
            return this._value;
            }
        
            public toString(): string {
            return `${this.name}: ${this._value}`;
            }
        }
        
        let value = new NamedValue('myNumber');
        value.setValue('myValue');
        console.log(value.toString()); // myNumber: myValue


    // Extends
        function createLoggedPair<S extends string | number, T extends string | number>(v1: S, v2: T): [S, T] {
            console.log(`creating pair: v1='${v1}', v2='${v2}'`);
            return [v1, v2];
        }



// ========================================================================================================== // 



// TypeScript Utility Types

    // Partial
        // Partial changes all the properties in an object to be optional.

        interface Point {
            x: number;
            y: number;
        }
            
        let pointPart: Partial<Point> = {}; // `Partial` allows x and y to be optional
        pointPart.x = 10;


    // Required
        // Required changes all the properties in an object to be required.

        interface Car {
            make: string;
            model: string;
            mileage?: number;
        }
            
        let myCar: Required<Car> = {
            make: 'Ford',
            model: 'Focus',
            mileage: 12000 // `Required` forces mileage to be defined
        };

    // Record
        // Record is a shortcut to defining an object type with a specific key type and value type.

        const nameAgeMap: Record<string, number> = {
            'Alice': 21,
            'Bob': 25
        };

        // Record<string, number> is equivalent to { [key: string]: number }

    
    // Omit
        // Omit removes keys from an object type.

        interface Person {
            name: string;
            age: number;
            location?: string;
        }
        
        const bob: Omit<Person, 'age' | 'location'> = {
            name: 'Bob'
            // `Omit` has removed age and location from the type and they can't be defined here
        };

    
    // Pick
        // Pick removes all but the specified keys from an object type.

        interface Person {
            name: string;
            age: number;
            location?: string;
        }
            
        const bob: Pick<Person, 'name'> = {
            name: 'Bob'
            // `Pick` has only kept name, so age and location were removed from the type and they can't be defined here
        };


    // Exclude
        // Exclude removes types from a union.

        type Primitive = string | number | boolean
        const value: Exclude<Primitive, string> = true; // a string cannot be used here since Exclude removed it from the type.


    // ReturnType
        // ReturnType extracts the return type of a function type.

        type PointGenerator = () => { x: number; y: number; };
            const point: ReturnType<PointGenerator> = {
            x: 10,
            y: 20
        };


    // Parameters
        // Parameters extracts the parameter types of a function type as an array.

        type PointPrinter = (p: { x: number; y: number; }) => void;
            const point: Parameters<PointPrinter>[0] = {
            x: 10,
            y: 20
        };

    
    // Readonly
        // Readonly is used to create a new type where all properties are readonly, 
        // meaning they cannot be modified once assigned a value.

        interface Person {
            name: string;
            age: number;
        }
        const person: Readonly<Person> = {
            name: "Dylan",
            age: 35,
        };
        person.name = 'Israel'; // prog.ts(11,8): error TS2540: Cannot assign to 'name' because it is a read-only property.



// ========================================================================================================== // 



// TypeScript Keyof

    // keyof is a keyword in TypeScript which is used to extract the key type from an object type.

    // keyof with explicit keys
        // When used on an object type with explicit keys, keyof creates a union type with those keys.

        interface Person {
            name: string;
            age: number;
        }
        // `keyof Person` here creates a union type of "name" and "age", other strings will not be allowed
        function printPersonProperty(person: Person, property: keyof Person) {
            console.log(`Printing person property ${property}: "${person[property]}"`);
        }
        let person = {
            name: "Max",
            age: 27
        };
        printPersonProperty(person, "name"); // Printing person property name: "Max"


    // keyof with index signatures
        // keyof can also be used with index signatures to extract the index type.
        
        type StringMap = { [key: string]: unknown };
        // `keyof StringMap` resolves to `string` here
        function createStringPair(property: keyof StringMap, value: string): StringMap {
          return { [property]: value };
        }



// ========================================================================================================== // 



// TypeScript Null & Undefined



    // By default null and undefined handling is disabled, and can be enabled by setting strictNullChecks to true.
    // The rest of this page applies for when strictNullChecks is enabled.

    // Types
        let value: string | undefined | null = null;
        value = 'hello';
        value = undefined;

        // When strictNullChecks is enabled, TypeScript requires values to be set unless 
        // undefined is explicitly added to the type. 


    // Optional Chaining
        interface House {
            sqft: number;
            yard?: {
            sqft: number;
            };
        }
        function printYardSize(house: House) {
            const yardSize = house.yard?.sqft;
            if (yardSize === undefined) {
            console.log('No yard');
            } else {
            console.log(`Yard is ${yardSize} sqft`);
            }
        }
        
        let home: House = {
            sqft: 500
        };
        
        printYardSize(home); // Prints 'No yard'


    // Nullish Coalescence
        function printMileage(mileage: number | null | undefined) {
            console.log(`Mileage: ${mileage ?? 'Not Available'}`);
        }
        
        printMileage(null); // Prints 'Mileage: Not Available'
        printMileage(0); // Prints 'Mileage: 0'

    
    // Null Assertion
        function getValue(): string | undefined {
            return 'hello';
        }
        let value = getValue();
        console.log('value length: ' + value!.length);


    // Array bounds handling
        // The config noUncheckedIndexedAccess can be used to change this behavior.
        let array: number[] = [1, 2, 3];
        let value = array[0]; // with `noUncheckedIndexedAccess` this has the type `number | undefined`



// ========================================================================================================== // 



// TypeScript Definitely Typed

        // Using non-typed NPM packages in TypeScript
        // npm install --save-dev @types/jquery 



// ========================================================================================================== // 



// TypeScript 5.x Updates

        // Template Literal Types
            type Color = "red" | "green" | "blue";
            type HexColor<T extends Color> = `#${string}`;

            // Usage:
            let myColor: HexColor<"blue"> = "#0000FF";

        // Index Signature Labels
            // Index Signature Labels allows us to label index signatures using computed property names. 
            // It helps in providing more descriptive type information when working with dynamic objects.

            // type DynamicObject = { [key: string as `dynamic_${string}`]: string };

            // Usage:
            let obj: DynamicObject = { dynamic_key: "value" };


// ========================================================================================================== // 

