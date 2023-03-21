require "Byebug"

class Employee

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        self.add_manager
    end

    def add_manager
        unless boss == nil
         @boss.add_employee(self)
        end
    end

    attr_reader :name, :title, :salary, :boss

    def bonus(multiplier)
        bonus = @salary * multiplier
    end
end

class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @employees = []
    end

    def add_employee(employee)
        @employees << employee
    end

    def bonus(multiplier)  #totalSalOfSubEmployees * multiplier
        sub_salary = 0
        @employees.each do |emp|
            # debugger
            if emp.class == Employee
                sub_salary += emp.salary
            else
                sub_salary += emp.bonus(1) + emp.salary
            end

        end
        sub_salary *= multiplier
    end
end
# Ned = Manager.new("Ned", "Founder", 1000000, nil)
# Darren = Manager.new("Darren", "TA Manager", 78000, Ned)
# Shawna = Employee.new("Shawna", "TA", 12000, Darren)
# David = Employee.new("David", "TA", 10000, Darren)
# p Ned.bonus(5) # => 500_000
# p Darren.bonus(4) # => 88_000
# p David.bonus(3) # => 30_000
# p Darren.employees
