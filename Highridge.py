class Worker:
    def __init__(self, name, gender, salary):
        self.name = name
        self.gender = gender
        self.salary = salary
        self.level = None

def generate_payment_slips(workers):
    for worker in workers:
        try:
            if 10000 < worker.salary < 20000:
                worker.level = "A1"
            elif 7500 < worker.salary < 30000 and worker.gender.lower() == "female":
                worker.level = "A5-F"
            else:
                worker.level = "Unknown"

            print(f"Name: {worker.name}, Gender: {worker.gender}, Salary: ${worker.salary}, Level: {worker.level}")
        except Exception as e:
            print(f"Error processing {worker.name}: {e}")

def main():
    workers = []

    # Dynamically create a list of workers (at least 400 workers)
    for i in range(400):
        workers.append(Worker(f"Worker {i+1}", "Male" if i % 2 == 0 else "Female", 10000 + (i * 100)))

    # Generate payment slips for each worker
    generate_payment_slips(workers)

if __name__ == "__main__":
    main()
