# Learning about Arithmetic in Julia

Today we will be learning how to perform basic arithmetic calculations in Julia.

Similar to what you learned in math class, `+`, `-`, and `*` are used for addition, subtraction, and multiplication. Try it out for yourself!

```julia
38 + 2

44 - 4

8 * 5
```

For division, the `\`operator is used:

```julia
80/2
```

And for exponentiating numbers, you can use `^`.

```julia
6^2 + 4
```

# Values and Types

In computer science, a **value** is just some data that can be manipulated by a program. In this lesson, we have encountered many different values, such as numbers or words.

In the previous section, you may have noticed that the result of dividing 80 by 2 was `40.0` and not `40`.

This is because computer scientists differentiate between numbers with and without decimal points as two different data types. In Julia, numbers with decimal points like `40.0` belong to the type `Float64`, and numbers without decimal points like  `40` belong to
the type `Int64`.

!!!Note:

When you are working with really big numbers such as `1,000,000`, do not include the commas if you want Julia to recognize it as an integer. For example, if you were to run this code:

```julia
1,000,000
```

you would see that Julia thinks that `1,000,000` is a list of integers!

Strings, which are sequences of characters fall under the type `String`. Basically, any characters defined within quotes are strings, even if they are numbers.

For example, explore what happens if you were to use the `typeof()` function on `2`.

```julia
typeof("2")
```
