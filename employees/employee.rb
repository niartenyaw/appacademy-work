class Employee

  attr_reader :salary

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    boss.add_subordinate(self) unless boss.nil?
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @subordinates = []
  end

  def bonus(multiplier)
    sum = @subordinates.inject(0) do |acc, s|
      if s.is_a?(Manager)
        acc += s.bonus(1)
      end
      acc + s.salary
    end
    sum * multiplier
  end

  def add_subordinate(employee)
    @subordinates << employee unless @subordinates.include?(employee)
  end

end

ned = Manager.new("Ned", "Founder", 1_000_000)
darren = Manager.new("Darren", "TA Manager", 78_000, ned)
shawna = Employee.new("Shawna", "TA", 12_000, darren)
david = Employee.new("David", "TA", 10_000, darren)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
