use std::io;

fn main() {
    print_menu();

    loop {
        let mut input_unit = String::new();

        io::stdin()
            .read_line(&mut input_unit)
            .expect("Failed to read line");

        let menu_num: u32 = match input_unit.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        let input_unit = if menu_num == 1 {
            "Celsius".to_string()
        } else if menu_num == 2 {
            "Fahrenheit".to_string()
        } else {
            println!("Please enter a valid option:");
            print_menu();
            continue;
        };

        let output_unit = if input_unit == "Celsius" {
            "Fahrenheit"
        } else {
            "Celsius"
        };

        loop {
            println!("What is the temperature in {}?", input_unit);

            let mut input_temperature = String::new();

            io::stdin()
                .read_line(&mut input_temperature)
                .expect("Failed to read line");

            let input_temperature: f64 = match input_temperature.trim().parse() {
                Ok(num) => num,
                Err(_) => continue,
            };

            let output_temperature = if input_unit == "Celsius" {
                celsius_to_fahrenheit(input_temperature)
            } else {
                fahrenheit_to_celsius(input_temperature)
            };

            println!(
                "The temperature in {} is: {} degrees",
                output_unit, output_temperature
            );
            break;
        }

        break;
    }
}

fn print_menu() {
    println!("Which direction would you like to convert?");
    println!("1.) Celsius to Fahrenheit");
    println!("2.) Fahrenheit to Celsius");
}

fn fahrenheit_to_celsius(x: f64) -> f64 {
    (x - 32.0) / 1.8
}

fn celsius_to_fahrenheit(x: f64) -> f64 {
    x * 1.8 + 32.0
}
