use std::io;

fn main() {
    println!("Which Fibonacci number would you like?");

    loop {
        let mut input_num = String::new();

        io::stdin()
            .read_line(&mut input_num)
            .expect("Failed to read line");

        let input_num: u32 = match input_num.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        if input_num > 0 {
            println!("Fibonacci number {} is {}", input_num, fib(input_num));
            break;
        } else {
            println!("Please enter a positive number:");
        }
    }
}

fn fib(x: u32) -> u32 {
    if x == 1 {
        0
    } else if x == 2 {
        1
    } else {
        fib(x - 2) + fib(x - 1)
    }
}
