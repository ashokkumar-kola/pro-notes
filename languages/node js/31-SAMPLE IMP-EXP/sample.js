
a = 0
var b = 10
let c = 20
const d = 30


function fun(a, b, c, d){
    console.log(a)
    console.log(b)
    console.log(c)
    console.log(d)

    return [a, b, c, d]
}

fun(a, b, c, d)


module.exports = { a, b, c, d, fun }