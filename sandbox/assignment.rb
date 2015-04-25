require_relative "../config/environment"

#puts Todolist.first.list_name

user1 = User.find_by login: "nb"

acct1 = Account.find_by first_name: "Napoleon"

listItaly = Todolist.find_by list_name: "Italian Campaign"
listRussia = Todolist.find_by list_name: "Russian Campaign"

i1Russia = Todoitem.find_by task_title: "Register Company Corp 4 men"
i2Russia = Todoitem.find_by task_title: "Follow up registration Comp Corp 4"
i3Russia = Todoitem.find_by task_title: "Russian rivers survey"
i4Russia = Todoitem.find_by task_title: "Practice building bridges as if over Volvograd River"
i5Russia = Todoitem.find_by task_title: "Send peace letter"
i1Italy = Todoitem.find_by task_title: "Contact Hannibal for elephants"
i2Italy = Todoitem.find_by task_title: "Register Comp Corp 10 men"

tagUrgent = Tag.find_by tag_name: "Urgent"
tagWife = Tag.find_by tag_name: "For wife Josephine"
tagFrenchWar = Tag.find_by tag_name: "French War Minister"
tagRussian = Tag.find_by tag_name: "Russian Foreign Minister"
tagConstruction = Tag.find_by tag_name: "Construction"

user1.account = acct1

listRussia.todoitems << i1Russia
listRussia.todoitems << i2Russia
listRussia.todoitems << i3Russia
listRussia.todoitems << i4Russia
listRussia.todoitems << i5Russia

listItaly.todoitems << i1Italy
listItaly.todoitems << i2Italy

user1.todolists << listItaly
user1.todolists << listRussia

# Adding tags to items
i1Russia.tags << tagUrgent
i1Russia.tags << tagFrenchWar
i2Russia.tags << tagFrenchWar
i3Russia.tags << tagConstruction
i4Russia.tags << tagFrenchWar
i5Russia.tags << tagUrgent
i5Russia.tags << tagRussian
i2Italy.tags << tagFrenchWar

# Listing the account information for a user
puts "\nACCOUNT INFORMATION FOR USER1:\n"
puts "#{user1.account.first_name} #{user1.account.last_name}, age:#{user1.account.age.to_s}"

# Listing the To Do Lists for user1
puts "\nLIST OF TO DO LISTS FOR USER1:\n"
puts user1.todolists.pluck(:list_name)

# Listing the To Do Items for the Italian Campaign
puts "\nLIST OF TO DO ITEMS FOR THE ITALIAN CAMPAIGN:\n"
puts listItaly.todoitems.pluck(:task_title)

# Listing Tags for "Send Peace Letter"
puts "\nLIST OF TAGS BELONGING TO 'SEND PEACE LETTER':\n"
puts i5Russia.tags.pluck(:tag_name)

# Listing Todoitems with "Urgent" tag
puts "\nLIST OF TO DO ITEMS WITH 'URGENT' TAG:\n"
puts tagUrgent.todoitems.pluck(:task_title)

# Exercise 4: Mapping Todoitems directly to User 
# Listing all the To Do Items for User1
puts "\nUSER1 TO DO ITEMS USING USER1 JOIN MAPPING:\n"
puts user1.usertodoitems.pluck(:task_title)

# Exercise 5: validating age (using a method in Account class) & gender
puts "\nAGE VALIDATION IN ACTION:\n"
acct2 = Account.new(gender: "male", age: 18, first_name: "English", last_name: "Guy")
acct2.save
puts acct2.errors.first

puts "\nGENDER VALIDATION IN ACTION:\n"
acct3 = Account.new(gender: "shemale", age: 25, first_name: "English2", last_name: "Guy2")
acct3.save
puts acct3.errors.first

# Exercise 6: The following statements are testing the default scope
puts "\nTO DO LISTS IN ASCENDING ORDER:\n"
puts Todolist.pluck(:list_due_date, :list_name)
puts "\nTO DO ITEMS IN ASCENDING ORDER:\n"
puts Todoitem.pluck(:due_date, :task_title)
