import 'package:flutter/material.dart';

import 'package:expense_tracker/widget/new_expense.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widget/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [];
  Category? _selectedCategory;

  double get _totalSpent {
    double sum = 0;
    for (final expense in _registeredExpenses) {
      sum += expense.amount;
    }
    return sum;
  }

  List<Expense> get _visibleExpenses {
    if (_selectedCategory == null) {
      return _registeredExpenses;
    }
    return _registeredExpenses
        .where((expense) => expense.category == _selectedCategory)
        .toList();
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  Widget _buildChip(BuildContext context, String label, Category? category) {
    final colors = Theme.of(context).colorScheme;
    final selected = _selectedCategory == category;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        showCheckmark: false,
        selectedColor: colors.primaryContainer,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: selected ? colors.onPrimaryContainer : null,
        ),
        onSelected: (_) {
          setState(() {
            _selectedCategory = category;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final colors = Theme.of(context).colorScheme;

    Widget mainContent = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.savings_outlined, size: 56, color: colors.primary),
          const SizedBox(height: 12),
          const Text('No expenses found. Start adding some!'),
        ],
      ),
    );

    if (_visibleExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _visibleExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    final totalCard = Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total spent',
                style: TextStyle(
                  fontSize: 13,
                  color: colors.onPrimaryContainer.withValues(alpha: 0.75),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '\$${_totalSpent.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: colors.onPrimaryContainer,
                ),
              ),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.account_balance_wallet_outlined,
            size: 32,
            color: colors.onPrimaryContainer,
          ),
        ],
      ),
    );

    final filterChips = SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildChip(context, 'All', null),
          for (final category in Category.values)
            _buildChip(
              context,
              category.name[0].toUpperCase() + category.name.substring(1),
              category,
            ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('ExpenseTracker')),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddExpenseOverlay,
        child: const Icon(Icons.add),
      ),
      body: width < 600
          ? Column(
              children: [
                totalCard,
                Chart(expenses: _registeredExpenses),
                filterChips,
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      totalCard,
                      Chart(expenses: _registeredExpenses),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      filterChips,
                      Expanded(child: mainContent),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
