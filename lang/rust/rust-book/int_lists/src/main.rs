use std::collections::HashMap;

fn main() {
    let list_of_integers = vec![1, 5, 5, 12, 10, 7, 3];
    mean_of_list(&list_of_integers);
    median_of_list(&list_of_integers);
    mode_of_list(&list_of_integers);
}

fn mean_of_list(list: &[usize]) {
    let mut total = 0;
    for i in list.iter() {
        total += i;
    }
    let mean = total / list.len();
    println!("{}", mean);
}

fn median_of_list(list: &[usize]) {
    let mut sorted_list = list.to_owned();
    sorted_list.sort();
    let mid_point = list.len() / 2;
    let median = sorted_list[mid_point];
    println!("{}", median);
}

fn mode_of_list(list: &[usize]) {
    let mut counts = HashMap::new();
    let mut most = 1;
    let mut mode = 0;
    for i in list.iter() {
        let count = counts.entry(i).or_insert(1);
        *count += 1;
        if *count > most {
            most = *count;
            mode = *i;
        }
    }
    println!("{}", mode);
}
