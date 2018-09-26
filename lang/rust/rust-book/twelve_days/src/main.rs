extern crate ordinal;

use ordinal::Ordinal;

fn main() {
    for num in 1..13 {
        let mut day = num;
        println!(
            "On the {} day of Christmas my true love gave to me",
            Ordinal(day)
        );
        while day > 0 {
            print_gift_for(day);

            day -= 1;
        }
    }
}

fn print_gift_for(day: u32) {
    if day == 12 {
        println!("Twelve drummers drumming,");
    } else if day == 11 {
        println!("eleven pipers piping,");
    } else if day == 10 {
        println!("ten lords a-leaping,");
    } else if day == 9 {
        println!("nine ladies dancing,");
    } else if day == 8 {
        println!("eight maids a-milking,");
    } else if day == 7 {
        println!("seven swans a-swimming,");
    } else if day == 6 {
        println!("six geese a-laying,");
    } else if day == 5 {
        println!("five golden rings.");
    } else if day == 4 {
        println!("Four calling birds,");
    } else if day == 3 {
        println!("three French hens,");
    } else if day == 2 {
        println!("two turtle doves and");
    } else if day == 1 {
        println!("a partridge in a pear tree!");
    }
}
