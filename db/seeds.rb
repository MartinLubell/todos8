Account.destroy_all
User.destroy_all
Todolist.destroy_all
Todoitem.destroy_all
Tag.destroy_all

#nb = User.create! [{login: "nb", password: "waterloo"}]
User.create! [
  {login: "nb", password: "waterloo"},
  { login: "Matt", password: "abc123" },
  { login: "Tim", password: "123abc" }
]

nbacct = Account.create! [{age: 38, gender: "male", first_name: "Napoleon", last_name: "Bonaparte"}]
nb = User.find_by login: "nb"
nb.account = nbacct.first

mattacct = Account.create! [{age: 30, gender: "male", first_name: "Matt", last_name: "Bonaparte"}]
mb = User.find_by login: "Matt"
mb.account = mattacct.first

timacct = Account.create! [{age: 28, gender: "male", first_name: "Tim", last_name: "Bonaparte"}]
tb = User.find_by login: "Tim"
tb.account = timacct.first

nb.todolists.create! [{list_name: "Italian Campaign", list_due_date: "1796/11/01"},
                {list_name: "Russian Campaign", list_due_date: "1812/11/30"}]

mb.todolists.create! [{list_name: "Italian Campaign MB", list_due_date: "1796/11/01"},
                {list_name: "Russian Campaign MB", list_due_date: "1812/11/30"}]

tb.todolists.create! [{list_name: "Italian Campaign TB", list_due_date: "1796/11/01"},
                {list_name: "Russian Campaign TB", list_due_date: "1812/11/30"}]

nblistI = Todolist.find_by list_name: "Italian Campaign"
nblistR = Todolist.find_by list_name: "Russian Campaign"

mblistI = Todolist.find_by list_name: "Italian Campaign MB"
mblistR = Todolist.find_by list_name: "Russian Campaign MB"

tblistI = Todolist.find_by list_name: "Italian Campaign TB"
tblistR = Todolist.find_by list_name: "Russian Campaign TB"

mblistI.todoitems.create! [{task_title: "Contact Hannibal for elephants", due_date: "1791/10/20", description: "Wondering if elephants can travel in the Alps!?", done: false},
                {task_title: "Register Comp Corp 10 men", due_date: "1791/10/15", description: "Ask for Corp 10 confirmations letters.", done: false} ]

mblistR.todoitems.create! [{task_title: "Register Company Corp 4 men", due_date: "1796/09/15", description: "Contact all French departments for conscripts.", done: true},
                {task_title: "Follow up registration Comp Corp 4", due_date: "1796/10/15", description: "Ask for Corp 4 confirmations letters.", done: true},
                {task_title: "Russian rivers survey", due_date: "1795/12/15", description: "Detailled river maps done by military surveyors.", done: true},
                {task_title: "Practice building bridges as if over Volvograd River", due_date: "1811/10/13", description: "Strength tests need to be performed.", done: false},
                {task_title: "Send peace letter", due_date: "1795/10/15", description: "Show we are friends before we attack.", done: false} ]

tblistI.todoitems.create! [{task_title: "Contact Hannibal for elephants", due_date: "1791/10/20", description: "Wondering if elephants can travel in the Alps!?", done: false},
                {task_title: "Register Comp Corp 10 men", due_date: "1791/10/15", description: "Ask for Corp 10 confirmations letters.", done: false} ]

tblistR.todoitems.create! [{task_title: "Register Company Corp 4 men", due_date: "1796/09/15", description: "Contact all French departments for conscripts.", done: true},
                {task_title: "Follow up registration Comp Corp 4", due_date: "1796/10/15", description: "Ask for Corp 4 confirmations letters.", done: false},
                {task_title: "Russian rivers survey", due_date: "1795/12/15", description: "Detailled river maps done by military surveyors.", done: true},
                {task_title: "Practice building bridges as if over Volvograd River", due_date: "1811/10/13", description: "Strength tests need to be performed.", done: false},
                {task_title: "Send peace letter", due_date: "1795/10/15", description: "Show we are friends before we attack.", done: false} ]

nblistI.todoitems.create! [{task_title: "Contact Hannibal for elephants", due_date: "1791/10/20", description: "Wondering if elephants can travel in the Alps!?", done: false},
                {task_title: "Register Comp Corp 10 men", due_date: "1791/10/15", description: "Ask for Corp 10 confirmations letters.", done: false} ]

nblistR.todoitems.create! [{task_title: "Register Company Corp 4 men", due_date: "1796/09/15", description: "Contact all French departments for conscripts.", done: true},
                {task_title: "Follow up registration Comp Corp 4", due_date: "1796/10/15", description: "Ask for Corp 4 confirmations letters.", done: false},
                {task_title: "Russian rivers survey", due_date: "1795/12/15", description: "Detailled river maps done by military surveyors.", done: true},
                {task_title: "Practice building bridges as if over Volvograd River", due_date: "1811/10/13", description: "Strength tests need to be performed.", done: false},
                {task_title: "Send peace letter", due_date: "1795/10/15", description: "Show we are friends before we attack.", done: false},
  {task_title: "Power Consolidation", due_date: "1799/10/12", description: "Combine our forces power.", done: true}]

taggedItems = Todoitem.find_by task_title: "Russian rivers survey"

taggedItems.tags.create! [{tag_name: "Urgent"}, {tag_name: "French War Minister"},{tag_name: "Construction"}]