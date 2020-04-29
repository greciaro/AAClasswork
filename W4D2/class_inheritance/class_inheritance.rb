class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        bonus = self.salary.to_i * multiplier
    end



end

class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def bonus(multiplier)
        e_salaries = 0
        employees.each do |employee| 
        e_salaries += employee.salary.to_i 
        end 
        bonus = e_salaries * multiplier
    end

    def add_employee(*new_employee)
        new_employee.each do |emp|
            self.employees << emp
        end
    end
        
    
end

if $PROGRAM_NAME == __FILE__
    p david = Employee.new("David", "TA","10000", "Darren")
    p "_____ "
    p shawna = Employee.new("Shawna", "TA", "12000" ,"Darren")
    p "_____ "
    p darren = Manager.new("Darren", "TA", "78000", "Ned")
    p "_____ "
    p ned = Manager.new("Ned", "Founder", "1000000", nil)
   

    darren.add_employee(david, shawna)
  
    ned.add_employee(darren, david, shawna)
    p "_____ "
    p darren.employees
    p "_____"
    p ned.employees

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000



end

