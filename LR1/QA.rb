=begin
 Файл для ответов на вопросы к лабораторным работам для:
  1) их лучшего усвоения
  2) надёжного хранения
=end

=begin
  ЛР 1

------------------------------------------------------------------------------
Опишите класс Array, основные методы объекта класса,
описать их принадлежность – модули или суперклассы.
доступ к элементам, извлечение значений, сортировка, фильтрация, поиск элементов.

В дополнение к методам, которые он объединяет с помощью модуля Enumerable,
класс Array имеет собственные методы для доступа к массивам, поиска и других манипуляций с ними.

Родителем или суперклассом класса Array является класс Object

Из класса Array можно использовать методы, которые есть в суперклассе Object, например

array = [5, 4, 1] - выведет все методы, доступные для данного объекта класса Array
puts array.methods

puts array.nil? - вернёт false т.к только nil может вернуть true на nil?

puts array.inspect - Возвращает понятное для человека строковое представление array

puts array.to_s - Возвращает строковое представление

                                                                        ОСНОВНЫЕ СОБСТВЕННЫЕ МЕТОДЫ КЛАССА ARRAY

Метод Array[] позволяет обращаться к необходимым элементам по индексам или отрезкам, указанным в аргументе

arr = [1, 2, 3, 4, 5, 6]
arr[2]    #=> 3
arr[100]  #=> nil
arr[-3]   #=> 4
arr[2, 3] #=> [3, 4, 5]
arr[1..4] #=> [2, 3, 4, 5]
arr[1..-3] #=> [2, 3, 4]

Также обратиться к нужному элементу можно с помощью метода .at с указанием индекса

arr.at(0) #=> 1

Также можно обратиться к первому и последнему элементу с помощью first и last.

Чтобы вернуть первые n элементов используется .take(n), а элементы после первых n - .drop(n)

Узнать длину массива можно с помощью .length или .count, узнать пуст ли массив можно с помощью .empty?
Узнать есть ли нужный элемент в массиве можно так: browsers.include?('Konqueror') #=> false

Добавить элементы в массив можно с помощью push и <<
arr = [1, 2, 3, 4]
arr.push(5) #=> [1, 2, 3, 4, 5]
arr << 6    #=> [1, 2, 3, 4, 5, 6]

Добавление элемента в начало массива
arr.unshift(0) #=> [0, 1, 2, 3, 4, 5, 6]

Добавление элементов по указанному индексу
arr.insert(3, 'apple')  #=> [0, 1, 2, 'apple', 3, 4, 5, 6]

Удалить последний элемент из массива и вернуть его .pop
arr =  [1, 2, 3, 4, 5, 6]
arr.pop #=> 6
arr #=> [1, 2, 3, 4, 5]

Удалить первый элемент .shift
arr.shift #=> 1
arr #=> [2, 3, 4, 5]

Удалить элемент с определённым индексом - delete_at():

arr.delete_at(2) #=> 4
arr #=> [2, 3, 5]

Удалить элемент по значению - delete():

arr = [1, 2, 2, 3]
arr.delete(2) #=> 2
arr #=> [1,3]

Метод для вывода уникальных значений в двух версиях - uniq и uniq!
arr = [2, 5, 6, 556, 6, 6, 8, 9, 0, 123, 556]
arr.uniq #=> [2, 5, 6, 556, 8, 9, 0, 123]

Метод .each для прохождения или итерации по каждому элементу массива
arr = [1, 2, 3, 4, 5]
arr.each {|a| print a -= 10, " "}
# prints: -9 -8 -7 -6 -5
#=> [1, 2, 3, 4, 5]

Метод итерирующий в обратном порядке .reverse_each

words = %w[first second third fourth fifth sixth]
str = ""
words.reverse_each {|word| str += "#{word} "}
p str #=> "sixth fifth fourth third second first "

Метод .map для создания нового массива из оригинального

arr.map {|a| 2*a}     #=> [2, 4, 6, 8, 10]
arr                   #=> [1, 2, 3, 4, 5]
arr.map! {|a| a**2}   #=> [1, 4, 9, 16, 25]
arr                   #=> [1, 4, 9, 16, 25]

Методы для non-destructive выбора элемента .select, .reject, .drop_while
arr = [1, 2, 3, 4, 5, 6]
arr.select {|a| a > 3}       #=> [4, 5, 6]
arr.reject {|a| a < 3}       #=> [3, 4, 5, 6]
arr.drop_while {|a| a < 4}   #=> [4, 5, 6]
arr                          #=> [1, 2, 3, 4, 5, 6]

Destructive Selection
select! and reject! are the corresponding destructive methods to select and reject

Similar to select vs. reject, delete_if and keep_if have the exact opposite result when supplied with the same block:

arr.delete_if {|a| a < 4}   #=> [4, 5, 6]
arr                         #=> [4, 5, 6]

arr = [1, 2, 3, 4, 5, 6]
arr.keep_if {|a| a < 4}   #=> [1, 2, 3]
arr                       #=> [1, 2, 3]

СОРТИРОВКА

a = 'abcde'.split('').shuffle
a # => ["e", "b", "d", "a", "c"]
a1 = a.sort
a1 # => ["a", "b", "c", "d", "e"]

a = 'abcde'.split('').shuffle
a # => ["e", "b", "d", "a", "c"]
a1 = a.sort {|a, b| a <=> b }
a1 # => ["a", "b", "c", "d", "e"]
a2 = a.sort {|a, b| b <=> a }
a2 # => ["e", "d", "c", "b", "a"]


...........................................

-----------------------------------------------------------
Добавление элементов в массив

Items can be added to the end of an array by using either push or <<

arr = [1, 2, 3, 4]
arr.push(5) #=> [1, 2, 3, 4, 5]
arr << 6    #=> [1, 2, 3, 4, 5, 6]
unshift will add a new item to the beginning of an array.

arr.unshift(0) #=> [0, 1, 2, 3, 4, 5, 6]
With insert you can add a new element to an array at any position.

arr.insert(3, 'apple')  #=> [0, 1, 2, 'apple', 3, 4, 5, 6]
Using the insert method, you can also insert multiple values at once:

arr.insert(3, 'orange', 'pear', 'grapefruit')
#=> [0, 1, 2, "orange", "pear", "grapefruit", "apple", 3, 4, 5, 6]

--------------------------------------------------------------------
Способы задать массив
An Array can contain different types of objects. For example, the array below contains an Integer, a String and a Float:

ary = [1, "two", 3.0] #=> [1, "two", 3.0]
An array can also be created by calling Array.new with zero, one (the initial size of the Array) or two arguments (the initial size and a default object).

ary = Array.new    #=> []
Array.new(3)       #=> [nil, nil, nil]
Array.new(3, true) #=> [true, true, true]
Note that the second argument populates the array with references to the same object. Therefore, it is only recommended in cases when you need to instantiate arrays with natively immutable objects such as Symbols, numbers, true or false.

To create an array with separate objects a block can be passed instead. This method is safe to use with mutable objects such as hashes, strings or other arrays:

Array.new(4) {Hash.new}    #=> [{}, {}, {}, {}]
Array.new(4) {|i| i.to_s } #=> ["0", "1", "2", "3"]
This is also a quick way to build up multi-dimensional arrays:

empty_table = Array.new(3) {Array.new(3)}
#=> [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
An array can also be created by using the Array() method, provided by Kernel, which tries to call to_ary, then to_a on its argument.

Array({:a => "a", :b => "b"}) #=> [[:a, "a"], [:b, "b"]]


-----------------------------------------------------------------------------------------------
Аккумуляторные методы
> numbers = [3, 5, 1, 4]

> numbers.reduce(0) { |sum, number| sum + number }
 => 13

> words = %w[Московский государственный университет]

> words.reduce('') { |abbr, word| abbr + word[0].upcase }
 => "МГУ"

> numbers.reduce(0) do |sum, number|
>   puts "sum: #{sum}, number: #{number}, result = #{sum + number}"
>   sum + number
> end

> numbers.reduce(100) { |sum, number| sum + number }
 => 113

> [3, 5, 1, 4].reduce(&:+)
 => 13

> [3, 5, 1, 4].reduce(:+)
 => 13

> [{a: 1}, {b: 2}, {c: 3}].reduce({}, :merge)
 => {:a=>1, :b=>2, :c=>3}

------------------------------------------------------------------------------
Ruby - это объектно-ориентированный язык программирования, и у него нет конкретной концепции функционального интерфейса,
подобной Java. Однако многие методы в Ruby можно использовать в функциональном стиле, что означает,
что их можно передавать в качестве аргументов другим функциям и комбинировать различными способами для достижения желаемого результата.
Вот некоторые распространенные методы Ruby, которые связаны с функциональным программированием:
карта: Этот метод применяет данный блок к каждому элементу в перечислимом объекте (например, массиве) и возвращает новый массив с результатами.
reduce (также известный как inject): этот метод объединяет элементы перечислимого объекта в одно значение путем итеративного применения двоичной операции к элементам.
select (также известный как filter): этот метод фильтрует элементы из перечислимого объекта на основе заданного условия,
возвращая новый массив с элементами, удовлетворяющими условию.
each: Этот метод выполняет заданный блок кода для каждого элемента в перечислимом объекте, но не возвращает нового значения.
сортировка: Этот метод сортирует элементы перечислимого объекта в
порядке возрастания на основе результата данного блока или на основе оператора сравнения по умолчанию <=>.
Эти методы встроены в модуль Enumerable, который разбит на несколько классов в Ruby, включая Array, Hash и Range.
В дополнение к этим методам Ruby также предоставляет функции более высокого порядка,
такие как lambda (также известная как ->) и proc, которые позволяют передавать блоки кода в качестве аргументов другим функциям и выполнять их позже.
=end

#----------------------------------------------------------------------------------------------

# Самый известный итератор, each, последовательно передает в блок все элементы объекта, от имени которого вызван метод.
#
# :001 > [1, 2, 3].each { |i| puts i + 2 }
# 3
# 4
# 5
# => nil