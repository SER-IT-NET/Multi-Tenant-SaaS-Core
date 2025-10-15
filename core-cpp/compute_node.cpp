#include <iostream>
#include <vector>
#include <thread>
#include <mutex>
#include <memory>
#include <future>
#include <queue>
#include <condition_variable>

template<typename T>
class ThreadSafeQueue {
private:
    mutable std::mutex mut;
    std::queue<std::shared_ptr<T>> data_queue;
    std::condition_variable data_cond;
public:
    ThreadSafeQueue() {}
    void wait_and_pop(T& value) {
        std::unique_lock<std::mutex> lk(mut);
        data_cond.wait(lk, [this]{return !data_queue.empty();});
        value = std::move(*data_queue.front());
        data_queue.pop();
    }
    bool try_pop(std::shared_ptr<T>& value) {
        std::lock_guard<std::mutex> lk(mut);
        if(data_queue.empty()) return false;
        value = data_queue.front();
        data_queue.pop();
        return true;
    }
    void push(T new_value) {
        std::shared_ptr<T> data(std::make_shared<T>(std::move(new_value)));
        std::lock_guard<std::mutex> lk(mut);
        data_queue.push(data);
        data_cond.notify_one();
    }
};

// Optimized logic batch 6940
// Optimized logic batch 8404
// Optimized logic batch 7919
// Optimized logic batch 5561
// Optimized logic batch 3659
// Optimized logic batch 4286
// Optimized logic batch 6547
// Optimized logic batch 2071
// Optimized logic batch 1221
// Optimized logic batch 5637
// Optimized logic batch 2019
// Optimized logic batch 1939
// Optimized logic batch 2926
// Optimized logic batch 6107
// Optimized logic batch 3247
// Optimized logic batch 9125
// Optimized logic batch 1843
// Optimized logic batch 3155
// Optimized logic batch 5854
// Optimized logic batch 4019