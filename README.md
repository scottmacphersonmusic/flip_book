# flip_book
by [Scott Macpherson](https://github.com/scottmacphersonmusic)
## Description
**flip_book** is a small ruby application that reverses the order of words in a string without using the `String#split` method.
## Usage
Create a new instance of `FlipBook` with a string:
```ruby
content = "together. room the tied really rug That"
book = FlipBook.new(content)
```
Use `#flip` to reverse the sentence:
```ruby
book.flip
# ==> "That rug really tied the room together."
```
## Aproach
This solution is best described backwards.  The private method `slice_first_word!` takes a string as an argument making the assumption that it has at least one space.  It uses the `String#slice!` method to return a substring up to and including the first whitespace.  Its necessary to take the space with the substring even though it gets removed with `rstrip` because by using the bang(`!`) version of `slice`, the initial string is permanently changed and the `split` method depends on a whitespace not occuring until after at least one non-whitespace character.

The `split` method begins by assigning a duplicate of the string initialized in `@content` to the variable `c`; we don't know if we'll create other methods in the future that depend on `@content` keeping its original state.  It news up an empty array `words` and then repeatedly pushes the return value of `slice_first_word!(c)` into it until `c` doesn't have any whitespace left in it. It then returns `words` with the remaining word from `c` pushed into it.

Now that the hard work is done, the public method `flip` simply reverses and joins the array of substrings returned by `split`.

By walking through the string chunk by chunk rather than iterating through the whole thing for every loop this solution should scale better; what if the string initialized at `@content` were actually the length of a book?!
## Credit
Refactor of original solution aided by [Brook Riggio](https://github.com/brookr).

README edited at [dillinger.io](dillinger.io).
