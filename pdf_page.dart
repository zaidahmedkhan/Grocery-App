import 'package:flutter/material.dart';
import 'package:grocery_app/model/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:grocery_app/services/Pdf_Services.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.deepPurple,
        ),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          // Check if cartItems is empty
          if (value.cartItems.isEmpty) {
            return Center(
              // Show a message or a loading indicator if cart is empty
              child: Text("Your cart is empty."),
            );
          }

          return Column(
            children: [
              const Text(
                "Order Confirmed!",
                style: TextStyle(
                  fontSize: 45,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Thank you for your order! This is a confirmation that we have received your order, and it will be delivered shortly. Below, you can generate the PDF summary of the items you have ordered. Feel free to save or print this document for your reference.\n \nIf you have any questions or need further assistance, please don't hesitate to contact our customer support team. We're here to help you with any inquiries you may have and ensure a smooth shopping experience.\n\n We appreciate your business and value you as our customer. Your satisfaction is our top priority, and we look forward to serving you again in the future. Thank you for choosing us!",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              const SizedBox(height: 55),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await _createPDF(value.cartItems);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 19, horizontal: 48),
                  ),
                  child: const Text(
                    'Generate PDF',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _createPDF(List<dynamic> cartItems) async {
    print("Cart Items: $cartItems");
    final PdfDocument document = PdfDocument();
    final page = document.pages.add();
    final PdfGraphics graphics = page.graphics;

    final PdfGrid grid = PdfGrid();
    grid.columns.add(count: 3);
    grid.headers.add(1);

    // Set header text
    grid.headers[0].cells[0].value = 'S.No';
    grid.headers[0].cells[1].value = 'Product';
    grid.headers[0].cells[2].value = 'Price';

    // Add cart items to the table
    for (int i = 0; i < cartItems.length; i++) {
      final dynamic item = cartItems[i];
      final PdfGridRow dataRow = grid.rows.add();

      dataRow.cells[0].value = (i + 1).toString();
      dataRow.cells[1].value = item[0]; // Product Name
      dataRow.cells[2].value = '\$' + item[1].toString(); // Price

      // Set text alignment for cells
      dataRow.cells[0].stringFormat.alignment = PdfTextAlignment.center;
      dataRow.cells[1].stringFormat.alignment = PdfTextAlignment.left;
      dataRow.cells[2].stringFormat.alignment = PdfTextAlignment.right;
    }

    // Layout the table
    grid.draw(
      page: page,
      bounds: const Rect.fromLTWH(0, 00, 500, 200), // Adjust positioning
      format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate),
    );

    // Calculate and display total items
    final int totalItems = cartItems.length;
    graphics.drawString(
      'Total items: $totalItems',
      PdfStandardFont(PdfFontFamily.helvetica, 16),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      bounds: const Rect.fromLTWH(02, 700, 600, 20), // Adjust positioning
    );

    // Calculate and display total price
    final cartModel = Provider.of<CartModel>(context, listen: false);
    final double total = cartModel.calculateTotal();
    graphics.drawString(
      'Total Price: \$$total',
      PdfStandardFont(PdfFontFamily.helvetica, 16),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      bounds: const Rect.fromLTWH(04, 720, 650, 30), // Adjust positioning
    );

    // final cartModel = Provider.of<CartModel>(context, listen: false);
    final double discount = cartModel.calculateDiscount();
    graphics.drawString(
      'Price After Discount \$$discount',
      PdfStandardFont(PdfFontFamily.helvetica, 16),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      bounds: const Rect.fromLTWH(06, 740, 700, 40), // Adjust positioning
    );
    // ... Rest of your code ...

    // Save the PDF and launch it
    final List<int> bytes = await document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }
}
