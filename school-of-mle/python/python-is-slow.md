# Why is Python so slow?

[Reference](https://hackernoon.com/why-is-python-so-slow-e5074b6fe55b)

## TLDR

- `python` is the bread and butter of any machine learning practitioner, but it has its drawbacks, one of them is speed
- `python` is a `dynamically typed` language; it can be used to solve a wide variety of problems, but there are more focused + faster alternatives available



### Statically vs. Dynamically typed languages

> In a **“Statically-Typed”** language, you have to specify the type of a variable when it is declared. Those would include C, C++, Java, C#, Go.

> In a **dynamically-typed** language, there are still the concept of types, but the type of a variable is dynamic.

> Statically-typed languages aren’t designed as such to make your life hard, they are designed that way because of the way the CPU operates. If everything eventually needs to equate to a simple binary operation, you have to convert objects and types down to a low-level data structure.

> Not having to declare the type isn’t what makes Python slow, the design of the Python language enables you to make almost anything dynamic. You can replace the methods on objects at runtime, you can monkey-patch low-level system calls to a value declared at runtime. Almost anything is possible.

> It’s this design that makes it incredibly hard to optimise Python.