module quick_start_counter::quick_start_counter {
    use moveos_std::account;
    struct Counter has key {
        count_value: u64
    }
    fun init() {
        let signer = moveos_std::signer::module_signer<Counter>();
        account::move_resource_to(&signer, Counter { count_value: 0 });
    }
    entry fun increase() {
        let counter = account::borrow_mut_resource<Counter>(@quick_start_counter);
        counter.count_value = counter.count_value + 1;
    }
    public fun value(): u64{
      let counter = account::borrow_mut_resource<Counter>(@quick_start_counter);
      counter.count_value
    }
}