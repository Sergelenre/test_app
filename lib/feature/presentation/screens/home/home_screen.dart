import 'package:flutter/material.dart';
import 'package:test/feature/presentation/widgets/home_widget.dart';
import 'package:test/sharedCustoms/custom_text.dart';
import 'package:test/theme/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greybackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 70,
                    left: 20,
                    right: 20,
                    bottom: 70,
                  ),
                  decoration: BoxDecoration(color: Color(0xFF306EFF)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTopBar(),
                      SizedBox(height: 30),
                      _buildBalanceCard(),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -40,
                  left: 0,
                  right: 0,
                  child: _buildOptionsCard(),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
              child: _buildTransactions(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        backgroundColor: Color(0xFF306EFF),
        elevation: 2,
        child: Icon(Icons.qr_code_scanner, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        elevation: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: _selectedIndex == 0 ? Color(0xFF306EFF) : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.loop,
                  color: _selectedIndex == 1 ? Color(0xFF306EFF) : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
              SizedBox(width: 40), // This creates space for the FAB
              IconButton(
                icon: Icon(
                  Icons.message,
                  color: _selectedIndex == 3 ? Color(0xFF306EFF) : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: _selectedIndex == 4 ? Color(0xFF306EFF) : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 4;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.emoji_events, color: Colors.white),
        Expanded(
          child: Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 12),
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(50),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.white),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search "Payments"',
                      hintStyle: TextStyle(
                        color: Colors.white70,
                        fontFamily: "Poppins",
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Icon(Icons.notifications, color: Colors.white),
      ],
    );
  }

  Widget _buildBalanceCard() {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: "🇺🇸"),
              SizedBox(width: 4),
              CustomText(
                text: 'US Dollar',
                color: AppColors.background,
                fontSize: 12,
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          ),
          SizedBox(height: 8),
          CustomText(
            text: '\$20,000',
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          CustomText(
            text: 'Available Balance',
            color: AppColors.background,
            fontSize: 12,
          ),
          SizedBox(height: 12),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: CustomText(
              text: 'Add Money',
              color: AppColors.background,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsCard() {
    return Padding(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OptionColumn(
                icon: Icons.circle,
                color: Colors.blue,
                label: 'Send',
              ),
              _verticalDivider(),
              OptionColumn(
                icon: Icons.circle,
                color: Colors.orange,
                label: 'Request',
              ),
              _verticalDivider(),
              OptionColumn(
                icon: Icons.circle,
                color: Colors.amber,
                label: 'Bank',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _verticalDivider() {
    return Container(width: 1, height: 30, color: AppColors.defaultBackground);
  }

  Widget _buildTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: "Transaction",
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            Icon(Icons.arrow_forward, size: 17),
          ],
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              _buildTransactionItem(
                Icons.credit_card,
                "Spending",
                "-\$500",
                Colors.indigo,
              ),
              _divider(),
              _buildTransactionItem(
                Icons.attach_money,
                "Income",
                "+\$3000",
                Colors.green,
              ),
              _divider(),
              _buildTransactionItem(
                Icons.receipt_long,
                "Bills",
                "-\$800",
                Colors.orange,
              ),
              _divider(),
              _buildTransactionItem(
                Icons.savings,
                "Savings",
                "-\$1000",
                Colors.amber,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _divider() => Container(height: 1, color: AppColors.greybackground);

  Widget _buildTransactionItem(
    IconData icon,
    String title,
    String amount,
    Color iconColor,
  ) {
    bool isNegative = amount.startsWith("-");
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withAlpha(30),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor),
          ),
          SizedBox(width: 16),
          Expanded(child: Text(title, style: TextStyle(fontSize: 16))),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              color: isNegative ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
