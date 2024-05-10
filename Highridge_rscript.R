Worker <- function(name, gender, salary) {
  list(
    name = name,
    gender = gender,
    salary = salary,
    level = NULL
  )
}

generate_payment_slips <- function(workers) {
  for (worker in workers) {
    tryCatch({
      if (worker$salary > 10000 & worker$salary < 20000) {
        worker$level <- "A1"
      } else if (worker$salary > 7500 & worker$salary < 30000 & tolower(worker$gender) == "female") {
        worker$level <- "A5-F"
      } else {
        worker$level <- "Unknown"
      }
      
      cat(sprintf("Name: %s, Gender: %s, Salary: $%s, Level: %s\n",
                  worker$name, worker$gender, worker$salary, worker$level))
    }, error = function(e) {
      cat(sprintf("Error processing %s: %s\n", worker$name, e$message))
    })
  }
}

main <- function() {
  workers <- list()
  
  # Dynamically create a list of workers (at least 400 workers)
  for (i in 1:400) {
    workers[[i]] <- Worker(paste0("Worker ", i), ifelse(i %% 2 == 0, "Male", "Female"), 10000 + (i * 100))
  }
  
  # Generate payment slips for each worker
  generate_payment_slips(workers)
}

main()

