#!/usr/bin/python3
"""Python script that that uses REST API, for a given employee ID,
   returns information about his/her TODO list progress
   this time exports data in the JSON format
   records all tasks from all employees
"""
import json
import requests

if __name__ == "__main__":
    users = requests.get("http://jsonplaceholder.typicode.com/users").json()
    tasks = requests.get("http://jsonplaceholder.typicode.com/todos").json()
    storage = {}

    for user in users:
        emp_id = user.get("id")
        username = user.get("username")
        all_tasks = []

        for task in tasks:
            if (task.get("userId") == emp_id and task.get("completed")):
                temp = {}
                temp["task"] = task.get("title")
                temp["completed"] = task.get("completed")
                temp["username"] = username
                all_tasks.append(temp)

        storage[emp_id] = all_tasks

    with open("todo_all_employees.json", 'w+') as jsonfile:
        json.dump(storage, jsonfile)
