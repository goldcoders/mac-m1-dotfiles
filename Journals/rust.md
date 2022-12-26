[2021-09-20 23:50] Ownership Rules
1. Each VALUE in Rust  has a VARIABLE  thats called its OWNER.
2. There can ONLY be ONE OWNER at A TIME.
3. When the owner goes OUT OF SCOPE , the Value will be DROPPED.

[2021-09-21 00:26] Move and Copy
Rust Defaults always to Move

Except when Simple Type Stored on the Stack
- Integers
- Boolean
- Characters
- Implement

On the HEAP such as String Type we can use CLONE to do a COPY

```rs
let x: i32 = 5;
let y: i32 = x; // COPY

let s1: String = String::from('hello');
let s2: String = s1; // Failed , MOVED
let s2: String = s1.clone(); // Success , COPY
```

[2021-09-21 00:27] ## Rules of Reference
1. At any given time, you can either have ONE MUTABLE REFERENCE
OR ANY NUMBER OF IMMUTABLE REFERENCE.

```
fn main() {
 let mut s: String = String::from('hello');
 // We can have  mutliple immutable reference
 let r1: &String = &s;
 let r2: &String = &s;

// We cannot Add Mutable Reference Here!
 println!('{}, {}', r1,r2); // SCOPE ENDS Here for r1 , r2

 // We Can Only Use A Mutable Reference After all Immutable Reference
 // Goes Out of Scope

 let r3: &mut String = &mut s;
 println!('{}', r3);
}
```

2. References must Always be Valid

```
fn main() {
let reference_to_nothing: &String = dangle();
}

fn dangle() -> &String { // Error Here: Use `'static` lifetime
 let s: String = String::from('hellow');
 &s // s scopes ends here so we cannot return it
 // value is dropped
}
```

[2021-09-21 00:50] ## Ownership
```
fn main() {
let s: String = String::from('hello');
takes_ownership(s);
println!('{}',s); // ERROR here , BORROW of MOVED VALUE,
// MOVED OCCURS because s has type STRING which
// Does not Implement COPY Trait
}

fn takes_ownership(some_string: String){
println!('{}',some_string);
// its dropped here out of scope
}
```

Passing A Variable to a Function ===
The Same as Assigning a Value to a New Variable

To solve this we need to use REFERENCE = &

When Object/Variable Implement COPY Trait
```
fn main(){
let x: i32 = 5;
makes_copy(some_integer: x);
println!('{}',x); // We can Still Print Here , Because X as integer
// Implments a Copy Trait , the value is copy
}

fn makes_copy(some_integer: i32){
println!('{}', some_integer);
}
```


Gives Ownership
```
fn main(){
let s1: String = gives_ownership();
println!('{}',s1); // moves ownership of String to s1
}

fn gives_ownership() -> String{
let some_string: String = String::from('hello');
some_string // implicit return
}
```

Take Ownership and Give it Back
// Can be Solved By Using Reference &

```
fn main(){
let s1: String = gives_ownership();
let s2: String = String::from('hello');
let s3: String = takes_and_give_back(a_string: s2);

println!('s1 = {} s3 = {}',s1,s3)
}

fn gives_ownership() -> String{
let some_string: String = String::from('hello');
some_string // implicit return
}

fn takes_and_give_back(a_string: String) -> String {
a_string
}
```

[2021-09-21 00:52] ## Reference Dont Take Ownership, Reference is the BORROWER

[2021-09-21 07:34] ## Structs
Structs allow us to have multiple imp blocks

Method vs Associated Functions

Method take a reference to self
Associated Functions we dont get pass the self argument

```
#[derive(Debug)] // implement Display trait on non native types
struct Rectangle {
    width: u32,
    height: u32
}
// method
impl Rectangle {
    fn area(&self) -> u32 {
     self.width * self.height;
    }
    fn can_hold(&self, other: &Rectangle) -> bool {
        self.width > other.width && self.height > other.height
    }
}
// associated functions
impl Rectangle {
    fn square(size: u32) -> Rectangle {
    width: size,
    height: size
    }
}

fn main(){
    let rect: Rectangle = Rectangle {
        width: 30,
        height: 50,
    };

    println!('rect: {:#?}',rect);

    println!('The are of the rectangle is {} square pixels.', rect.area());
}

```

[2021-09-21 08:26] ## Traits
Traits are Shared Behaviour

syntax:
`impl <Trait> for <Struct>`

```
// in dart it looks like abstract class methods
pub trait Summary {
    fn summarize(&self) -> String;
    // we can also define a default implementation
    fn summarize(&self) -> String {
       String::('read more')
    }
}

pub struct NewsArticle {
    pub author: String,
    pub  headline: String,
    pub content: String
}

// override default implementation of summarize
impl Summary for NewsArticle {
    fn summarize(&self) -> String {
        format!('{}, by {}', self.headline, self.author) // no semi color ;
        // since we wanna auto return it
    }

}
// to use the default implementation of summarize
impl Summary for NewsArticle {}
```

Using Trait as Arguments
```
pub fn notify(item: &impl Summary) { // reference any type that implement Summary
    println!('Breaking News!, {}',item.summarize());
}

let article: NewsArticle = NewsArticle {
    author: String::from('@johndoe'),
    content: String::from('Hello WOrld'),
    reply: false,
    retweet: false,
}
// we can simple call notify that reference NewsArticle
notify(&article);
```

this is a Syntactic Sugar for `TRAIT BOUND`
```
pub fn notify<T: Summary>(item: &T) { // this generic of type T is limited to something that implments Summary Trait
   println('Breaking News! {}', item.summarize());
}
```

to declare multiple trait we use `+`
```
fn some_func<T: Display + Clone + Debug>(t: &T) -> i32 {
 // ..
}
```

using `where` clause when using multiple traits on multiple  generic types
NOTE: THIS IS MORE READABLE!
```
fn some_func<T,U>(t:&T,u: &U) -> i32
    where T: Display + Clone + Debug,
          U: Clone + Debug
{
  // ...
}
```
NOTE:
// Returning Types that Implements a Certain trait
// is More useful instead of Concreate Types
// inside closure and iterators

We can also Implement a Trait on a Type that implemtents another Trait
```
impl <T: Display> ToString for T{
 // --snip
}
```

[2021-09-21 09:15] ## Lifetimes
## Rules
1. Each Parameter that is a reference gets its own lifetime parameter
2. If there is exactly one input lifetime paramter,
that lifetime is assigned to all output lifetime paramters
```
// defined the lifetime
// fn first_word<'a>(s: &'a str) -> &'a str {

// we can omit lifetime annotation as such
// by following rule 1 & 2
fn first_word(s: &str) -> &str {
    let bytes: &[u8] = s.as_bytes();

    for(i: usize, & item: u8) in bytes.iter().enumerate(){
        if itemm == b' ' {
           return &s[0..i];
        }
    }
    &s[..]
}
```
3. If there are multiple input lifetime paramters
but one of them is &self or &mut self
the lifetime of self is assigned to all output lifetime parameters
// rule 3 mostly used on methods

```
struct ImportantExcerpt<'a> {
     part: &'a str,
}

impl <'a> ImportantExcerpt<'a> {
    // we dont need to specify the output lifetime here coz
    // one of theme is &self or &mut self
    fn return_part(&self, announcement: &str) -> &str {
        println!('Attention please: {}',announcement);
        self.part
    }
    // but we can explicitly define the lifetime
    fn return_part(&'a self, announcement: &str) -> &'a str {
    // same as above
}
```

## Static lifetimes
- live the same as the lifetime of the Application
```
fn main() {
    let s: &'static str = 'I have Static lifetime';
}
```


** to fix dangling reference we use Generic Lifetime Annotations **
// convention is a tick with lowercase letter that is in order
// 'a , 'b

** or we take the ownership by not using reference **

```
fn main() {
    let String1: String::from('hello');
    let String2: String::from('world');

    let result: &str = longest(x: string1.as_str(), y: string2.as_str());
    println!('The Longest String is {}',result);
}
// &i32          // a reference
// &'a i32       // a reference with an explicit lifetime
// &'a mut i32   // a mutable reference with an explicit lifetime
fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len(){
        x
    }else {
        y
    }
}
```
// Generic Lifetime Annotations
// there is a relationship between x, y and return value
// if x has a smaller lifetime than y
// then the lifetime of the return statement will be the same as x
// then if y has a smaller lifetime than x
// then the value of the lifetime will be the same as y

## Combo, Generic Type, Lifetime Annotations, Trait Bound
```
use std::fmt::Display;

fn longest_with_an_announcement<a',T> (
    x: &'a str,
    y: &'a str,
) -> &'a str
where
    T: Display,
{
    println!('Annoucement! {}', ann);
    if x.len() > y.len() {
        x
    } else {
        y
    }
}
```
