from budget import Expense


class BudgetList():
    def __init__(self, budget):
        self.budget = budget
        self.sum_expenses = 0
        self.expenses = []
        self.sum_overages = 0
        self.overages = []

    def append(self, item):
        # Checks if item is a number
        if (self.sum_expenses+item < self.budget):
            self.expenses.append(item)
            self.sum_expenses += item
        # Else appends to the overages list and adds to the overage total
        else:
            self.overages.append(item)
            self.sum_overages += item

    def __len__(self):
        return (len(self.expenses) + len(self.overages))


def main():
    # Setting budget to 1200
    myBudgetList = BudgetList(1200)

    expenses = Expense.Expenses()
    expenses.read_expenses('data/spending_data.csv')

    for expense in expenses.list:
        myBudgetList.append(expense.amount)

    print('The count of all expenses: ' + str(len(myBudgetList)))


if __name__ == "__main__":
    main()
