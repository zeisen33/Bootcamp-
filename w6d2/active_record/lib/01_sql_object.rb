require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  require 'active_support/inflector'
  def self.columns
    DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      LIMIT
        0
      SQL
  end

  def self.columns_helper(cols)
    sym_cols = []
    cols.each do |col|
      sym_cols << col.to_sym
    end
    sym_cols
  end

  def self.columns
    results = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      LIMIT
        0
      SQL
    self.columns_helper(results[0])
  end

  # def self.columns_helper(cols)
  #   sym_cols = []
  #   cols.each do |col|
  #     sym_cols << col.to_sym
  #   end
  #   sym_cols
  # end

  def self.finalize!
    # send attr_accessor to self with each instance variable as args
  end

  def self.table_name=(table_name)
    @@class_name = table_name
  end

  def self.table_name
    @@class_name ||= self.to_s.tableize
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    # ...
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end

class BigDog < SQLObject
end

# p BigDog.table_name # => "big_dogs"
