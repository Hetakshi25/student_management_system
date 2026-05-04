class Student:
    def __init__(self, student_id, name, age, course):
        self.student_id = student_id
        self.name = name
        self.age = age
        self.course = course

    def __str__(self):
        return f"ID: {self.student_id}, Name: {self.name}, Age: {self.age}, Course: {self.course}"


class StudentManagementSystem:
    def __init__(self):
        self.students = []

    # Add Student
    def add_student(self):
        student_id = input("Enter Student ID: ")
        name = input("Enter Name: ")
        age = input("Enter Age: ")
        course = input("Enter Course: ")

        student = Student(student_id, name, age, course)
        self.students.append(student)
        print("Student added successfully!\n")

    # View All Students
    def view_students(self):
        if not self.students:
            print("No students found.\n")
            return

        print("\n--- Student List ---")
        for student in self.students:
            print(student)
        print()

    # Search Student
    def search_student(self):
        student_id = input("Enter Student ID to search: ")
        for student in self.students:
            if student.student_id == student_id:
                print("Student Found:")
                print(student)
                return
        print("Student not found.\n")

    # Update Student
    def update_student(self):
        student_id = input("Enter Student ID to update: ")
        for student in self.students:
            if student.student_id == student_id:
                student.name = input("Enter new name: ")
                student.age = input("Enter new age: ")
                student.course = input("Enter new course: ")
                print("Student updated successfully!\n")
                return
        print("Student not found.\n")

    # Delete Student
    def delete_student(self):
        student_id = input("Enter Student ID to delete: ")
        for student in self.students:
            if student.student_id == student_id:
                self.students.remove(student)
                print("Student deleted successfully!\n")
                return
        print("Student not found.\n")


# Main Menu
def main():
    system = StudentManagementSystem()

    while True:
        print("===== Student Management System =====")
        print("1. Add Student")
        print("2. View Students")
        print("3. Search Student")
        print("4. Update Student")
        print("5. Delete Student")
        print("6. Exit")

        choice = input("Enter your choice: ")

        if choice == "1":
            system.add_student()
        elif choice == "2":
            system.view_students()
        elif choice == "3":
            system.search_student()
        elif choice == "4":
            system.update_student()
        elif choice == "5":
            system.delete_student()
        elif choice == "6":
            print("Exiting program...")
            break
        else:
            print("Invalid choice! Please try again.\n")


if __name__ == "__main__":
    main()