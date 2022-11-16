require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = Array.new
        @payroll = Array.new
    end

    def valid_title?(title)
        @salaries.keys.include?(title)
    end

    def >(otherStartup)
        self.funding > otherStartup.funding
    end

    def hire(employee_name, title)
        if !valid_title?(title)
            raise ArgumentError.new "title is invalid" 
        else
            employee = Employee.new(employee_name, title)
            @employees << employee
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        # p employee
        # p @funding
        # p @salaries[employee.title]
        if @funding > salary
            employee.pay(salary)
            @funding -= salary
        else
            raise StandardError.new "employee wage higher than funding"
        end
    end

    def payday
        @employees.each do |employee|
            pay_employee(employee)
        end
    end

    def jobs_filled
        hsh = Hash.new(0)
        @employees.each do |employee|
            hsh[employee.title] += 1
        end 
        hsh
    end

    def average_salary
        total_payroll = 0
        jobs_filled.each do |role, count|
            i = count
            while i > 0
                total_payroll += @salaries[role]
                i -= 1
            end
        end
        1.0 * total_payroll / @employees.length 
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |role, salary|
            if !@salaries.keys.include?(role)
                @salaries[role] = salary
            end
        end
        @employees += startup.employees
        startup.close
    end
end

# google = Startup.new("Google", 7000, {"CEO"=>4800, "CTO"=>3800, "Pilot"=>2500})
# google.hire("Reginald", "CEO")
# google.hire("Abajeen", "CTO")
# google.pay_employee(Employee.new("Reginald", "CEO"))
# # p google.average_salary
# facebook = Startup.new("FB", 5000, {"CEO"=>5000, "Executive Assistant"=> 2000, "Office dog" => 100})
# facebook.hire("Zuck", "CEO")
# facebook.hire("Rufus", "Office dog")
# google.acquire(facebook)