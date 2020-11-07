import 'package:farmers_market_web/blocs/auth_bloc.dart';
import 'package:farmers_market_web/blocs/product_bloc.dart';
import 'package:farmers_market_web/models/data.dart';
import 'package:farmers_market_web/sections/bottom_navigator.dart';
import 'package:farmers_market_web/sections/footer.dart';
import 'package:farmers_market_web/styles/base.dart';
import 'package:farmers_market_web/styles/colors.dart';
import 'package:farmers_market_web/styles/text.dart';
import 'package:farmers_market_web/styles/textfields.dart';
import 'package:farmers_market_web/widgets/form_TextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  final String productId;

  AddProduct({this.productId});
  @override
  AddProductState createState() {
    return AddProductState();
  }
}

class AddProductState extends State<AddProduct> {
  var data;
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  ///////////////////////for drop down/////////////////////////////////////////////
  String value = "";
  List<DropdownMenuItem<String>> menuitems = List();
  bool disabledropdown = true;
///////////////////////////////////////////////////////////////////////////More on drop down////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  final web = {
    "1": "PHP",
    "2": "Python",
    "3": "Node JSs",
  };

  final app = {
    "1": "Java",
    "2": "Flutter",
    "3": "React Native",
  };

  final desktop = {
    "1": "JavaFx",
    "2": "Tkinter",
    "3": "Electron",
  };

  void populateweb() {
    for (String key in web.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(web[key]),
        ),
        value: web[key],
      ));
    }
  }

  void populateapp() {
    for (String key in app.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(app[key]),
        ),
        value: app[key],
      ));
    }
  }

  void populatedesktop() {
    for (String key in desktop.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(desktop[key]),
        ),
        value: desktop[key],
      ));
    }
  }

  void selected(_value) {
    if (_value == "Web") {
      menuitems = [];
      populateweb();
    } else if (_value == "App") {
      menuitems = [];
      populateapp();
    } else if (_value == "Desktop") {
      menuitems = [];
      populatedesktop();
    }
    setState(() {
      value = _value;
      disabledropdown = false;
    });
  }

  void secondselected(_value) {
    if (_value != null) {
      //menuitems = [];
    }
    setState(() {
      value = _value;
      disabledropdown = true;
    });
  }

////////////////////////////////////////////////////////end drop down/////////////////////////////////
  final ValueChanged _onChanged = (val) => print(val);
  var menuItems = [
    "Home & Living",
    "Art & Collectables",
    "Jewellery & Accessories",
    "Designer Clothes",
    "Gift Ideas",
    "Decors",
    "Everyday Favourites"
  ];
  @override
  void initState() {
    var productBloc = Provider.of<ProductBloc>(context, listen: false);
    productBloc.productSaved.listen((saved) {
      if (saved != null && saved == true && context != null) {
        Fluttertoast.showToast(
            msg: "Product Saved",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: AppColors.lightblue,
            textColor: Colors.white,
            fontSize: 16.0);
        print('flutter toast');
        Navigator.of(context).pop();
      }
    });
    super.initState();
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    var productBloc = Provider.of<ProductBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      // backgroundColor: AppColors.lightgray,
      appBar: AppBar(
        backgroundColor: AppColors.darkblue,
        title: Text('FormBuilder Example'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: BaseStyles.listPadding,
            child: Divider(color: AppColors.darkblue),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: FormBuilder(
              // context,
              key: _fbKey,
              // autovalidate: true,
              initialValue: {
                'movie_rating': 3,
                'filter_chip': ['Test', 'Test 1'],
                'date': DateTime.now(),
              },
              readOnly: false,
              child: Column(
                children: <Widget>[
                  StreamBuilder<String>(
                      stream: productBloc.productName,
                      builder: (context, snapshot) {
                        return FormTextField(
                          hintText: 'Product Name',
                          materialIcon: FontAwesomeIcons.shoppingBasket,
                          errorText: snapshot.error,
                          onChanged: productBloc.changeProductName,
                        );
                      }),
                  SizedBox(height: 20),
                  StreamBuilder<double>(
                      stream: productBloc.unitPrice,
                      builder: (context, snapshot) {
                        return FormTextField(
                          hintText: 'Price for each item',
                          textInputType: TextInputType.number,
                          materialIcon: FontAwesomeIcons.tag,
                          errorText: snapshot.error,
                          onChanged: productBloc.changeUnitPrice,
                        );
                      }),
                  SizedBox(height: 20),
                  StreamBuilder<int>(
                      stream: productBloc.availableUnits,
                      builder: (context, snapshot) {
                        return FormTextField(
                          hintText: 'Enter Number of vailable items',
                          textInputType: TextInputType.number,
                          materialIcon: FontAwesomeIcons.cubes,
                          errorText: snapshot.error,
                          onChanged: productBloc.changeAvailableUnits,
                        );
                      }),
                  SizedBox(height: 20),
////////////////////////////////////date picker ////////////////////////////////////
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: TextFieldStyles.textBoxHorizontal,
                        vertical: TextFieldStyles.textBoxVertical),
                    child: FormBuilderDateTimePicker(
                      textAlign: TextAlign.center,
                      style: TextStyles.body,
                      attribute: 'date',
                      onChanged: _onChanged,
                      inputType: InputType.both,
                      decoration: TextFieldStyles.formCountryDecoration(),
                      validator: (val) => null,

                      // locale: Locale('ru'),
                      fieldLabelText:
                          'Select the Date which the Product was posted ',
                      initialTime: TimeOfDay(hour: 8, minute: 0),
                      initialValue: DateTime.now(),
                      // readonly: true,
                    ),
                  ),
                  SizedBox(height: 20),
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////Category Drop down'//////////////////////////////////////////////////////////////////////////////////////////
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: TextFieldStyles.textBoxHorizontal,
                        vertical: TextFieldStyles.textBoxVertical),
                    child: FormBuilderDropdown(
                      attribute: 'category',
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.category,
                              size: 35.0, color: AppColors.lightblue),
                          contentPadding: EdgeInsets.only(
                              left: 8, right: 60, top: 8, bottom: 8),
                          hintStyle: TextFieldStyles.placeholder,
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.straw,
                                  width: BaseStyles.borderWidth),
                              borderRadius: BorderRadius.circular(
                                  BaseStyles.borderRadius)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.straw,
                                  width: BaseStyles.borderWidth),
                              borderRadius: BorderRadius.circular(
                                  BaseStyles.borderRadius)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.straw,
                                  width: BaseStyles.borderWidth),
                              borderRadius: BorderRadius.circular(
                                  BaseStyles.borderRadius)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.red,
                                  width: BaseStyles.borderWidth),
                              borderRadius: BorderRadius.circular(
                                  BaseStyles.borderRadius)),
                          labelText: 'Select Product Category',
                          labelStyle: TextStyles.frontcardtext),
                      hint: Text('Select Category'),
                      validators: [FormBuilderValidators.required()],
                      items: [
                        DropdownMenuItem<String>(
                          value: "App",
                          child: Center(
                            child: Text("App"),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "Web",
                          child: Center(
                            child: Text("Web"),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "Desktop",
                          child: Center(
                            child: Text("Desktop"),
                          ),
                        ),
                      ],
                      onChanged:
                          disabledropdown ? (_value) => selected(_value) : null,
                      // isExpanded: false,
                      allowClear: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////Second Drop down////////////////////////////////////////////////////////////////////////
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: TextFieldStyles.textBoxHorizontal,
                        vertical: TextFieldStyles.textBoxVertical),
                    child: FormBuilderDropdown(
                      attribute: 'sub category',
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.category_outlined,
                              size: 35.0, color: AppColors.lightblue),
                          contentPadding: EdgeInsets.only(
                              left: 8, right: 60, top: 8, bottom: 8),
                          hintStyle: TextFieldStyles.placeholder,
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.straw,
                                  width: BaseStyles.borderWidth),
                              borderRadius: BorderRadius.circular(
                                  BaseStyles.borderRadius)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.straw,
                                  width: BaseStyles.borderWidth),
                              borderRadius: BorderRadius.circular(
                                  BaseStyles.borderRadius)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.straw,
                                  width: BaseStyles.borderWidth),
                              borderRadius: BorderRadius.circular(
                                  BaseStyles.borderRadius)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.red,
                                  width: BaseStyles.borderWidth),
                              borderRadius: BorderRadius.circular(
                                  BaseStyles.borderRadius)),
                          labelText: 'Select Product Sub Category',
                          labelStyle: TextStyles.frontcardtext),
                      hint: Text('Select Sub Category'),
                      validators: [FormBuilderValidators.required()],
                      items: menuitems,
                      onChanged: disabledropdown
                          ? null
                          : (_value) => secondselected(_value),

                      // isExpanded: false,
                      allowClear: true,
                    ),
                  ),
                  SizedBox(height: 15),
//////////////////////////////////////Product Occassion////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: TextFieldStyles.textBoxHorizontal,
                        vertical: TextFieldStyles.textBoxVertical),
                    child: FormBuilderCheckboxGroup(
                      wrapAlignment: WrapAlignment.center,
                      wrapCrossAxisAlignment: WrapCrossAlignment.center,
                      decoration: InputDecoration(
                          labelText: 'Choose Product Ocassion if Applicable',
                          labelStyle: TextStyles.cardtext),
                      attribute: 'Ocassions',
                      initialValue: ['Baptism'],
                      options: [
                        FormBuilderFieldOption(value: 'Birthday'),
                        FormBuilderFieldOption(value: 'Baptism'),
                        FormBuilderFieldOption(value: 'Bridal Shower'),
                        FormBuilderFieldOption(value: 'Confirmation'),
                        FormBuilderFieldOption(value: 'Engagement'),
                        FormBuilderFieldOption(value: 'First Communion'),
                        FormBuilderFieldOption(value: 'Graduation'),
                        FormBuilderFieldOption(value: 'Grief & Mourning'),
                        FormBuilderFieldOption(value: 'House Warming'),
                        FormBuilderFieldOption(value: 'Wedding'),
                      ],
                      onChanged: _onChanged,
                    ),
                  ),
                  SizedBox(height: 15),
/////////////////////////////////Product Color///////////////////////////////////////////////////////
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: TextFieldStyles.textBoxHorizontal,
                        vertical: TextFieldStyles.textBoxVertical),
                    child: FormBuilderCheckboxGroup(
                      wrapAlignment: WrapAlignment.center,
                      wrapCrossAxisAlignment: WrapCrossAlignment.center,
                      decoration: InputDecoration(
                          labelText: 'Choose Product Colors',
                          labelStyle: TextStyles.cardtext),
                      attribute: 'colors',
                      initialValue: ['Gray'],
                      options: [
                        FormBuilderFieldOption(value: 'Blue'),
                        FormBuilderFieldOption(value: 'Black'),
                        FormBuilderFieldOption(value: 'Brown'),
                        FormBuilderFieldOption(value: 'Beige'),
                        FormBuilderFieldOption(value: 'Bronze'),
                        FormBuilderFieldOption(value: 'Clear'),
                        FormBuilderFieldOption(value: 'Copper'),
                        FormBuilderFieldOption(value: 'Gold'),
                        FormBuilderFieldOption(value: 'Gray'),
                        FormBuilderFieldOption(value: 'Green'),
                        FormBuilderFieldOption(value: 'Orange'),
                        FormBuilderFieldOption(value: 'Pink'),
                        FormBuilderFieldOption(value: 'Rainbow'),
                        FormBuilderFieldOption(value: 'Purple'),
                        FormBuilderFieldOption(value: 'Red'),
                        FormBuilderFieldOption(value: 'Rose Gold'),
                        FormBuilderFieldOption(value: 'Silver'),
                        FormBuilderFieldOption(value: 'White'),
                        FormBuilderFieldOption(value: 'Yellow'),
                      ],
                      onChanged: _onChanged,
                    ),
                  ),
                  SizedBox(height: 15),
///////////////////////////////////////////////////////Adding Sizes /////////////////////////////////////////////////////////////
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: TextFieldStyles.textBoxHorizontal,
                        vertical: TextFieldStyles.textBoxVertical),
                    child: FormBuilderCheckboxGroup(
                      wrapAlignment: WrapAlignment.center,
                      wrapCrossAxisAlignment: WrapCrossAlignment.center,
                      decoration: InputDecoration(
                          labelText: 'Choose Product Sizes',
                          labelStyle: TextStyles.cardtext),
                      attribute: 'sizes',
                      initialValue: ['S'],
                      options: [
                        FormBuilderFieldOption(value: 'XXS'),
                        FormBuilderFieldOption(value: 'XS'),
                        FormBuilderFieldOption(value: 'S'),
                        FormBuilderFieldOption(value: 'M'),
                        FormBuilderFieldOption(value: 'L'),
                        FormBuilderFieldOption(value: 'XL'),
                        FormBuilderFieldOption(value: 'XXL'),
                        FormBuilderFieldOption(value: 'OX'),
                        FormBuilderFieldOption(value: '1X'),
                        FormBuilderFieldOption(value: '2X'),
                        FormBuilderFieldOption(value: '3X'),
                        FormBuilderFieldOption(value: '4X'),
                        FormBuilderFieldOption(value: '5X'),
                        FormBuilderFieldOption(value: 'One size'),
                        FormBuilderFieldOption(value: 'One size(plus)'),
                      ],
                      onChanged: _onChanged,
                    ),
                  ),
                  SizedBox(height: 15),

////////////////////////////////////Images for The Products/////////////////////////////////////////////
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: TextFieldStyles.textBoxHorizontal,
                        vertical: TextFieldStyles.textBoxVertical),
                    child: FormBuilderImagePicker(
                      attribute: 'images',
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8.0),
                        labelText: 'Product Images',
                        labelStyle: TextStyles.cardtext,
                      ),
                      defaultImage: NetworkImage(
                          'https://cohenwoodworking.com/wp-content/uploads/2016/09/image-placeholder-500x500.jpg'),
                      maxImages: 4,
                      iconColor: Colors.red,
                      // readOnly: true,
                      validators: [
                        FormBuilderValidators.required(),
                        (images) {
                          if (images.length < 2) {
                            return 'Two or more images required.';
                          }
                          return null;
                        }
                      ],
                      onChanged: _onChanged,
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: TextFieldStyles.textBoxHorizontal,
                        vertical: TextFieldStyles.textBoxVertical),
                    child: FormBuilderCountryPicker(
                      initialValue: 'United States',
                      attribute: 'country',
                      // readOnly: true,
                      // style: TextStyle(color: Colors.black, fontSize: 18),
                      priorityListByIsoCode: ['US'],
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.map,
                              size: 35.0, color: AppColors.lightblue),
                          contentPadding: EdgeInsets.only(
                              left: 8,
                              right: MediaQuery.of(context).size.width / 2,
                              top: 8,
                              bottom: 8),
                          hintStyle: TextFieldStyles.placeholder,
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.straw,
                                  width: BaseStyles.borderWidth),
                              borderRadius: BorderRadius.circular(
                                  BaseStyles.borderRadius)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.straw,
                                  width: BaseStyles.borderWidth),
                              borderRadius: BorderRadius.circular(
                                  BaseStyles.borderRadius)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.straw,
                                  width: BaseStyles.borderWidth),
                              borderRadius: BorderRadius.circular(
                                  BaseStyles.borderRadius)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.red,
                                  width: BaseStyles.borderWidth),
                              borderRadius: BorderRadius.circular(
                                  BaseStyles.borderRadius)),
                          labelText: 'Seller Country',
                          labelStyle: TextStyles.frontcardtext),
                      validators: [
                        FormBuilderValidators.required(
                            errorText: 'This field required.'),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////ADDING PHONE FIELD/////////////////////////////////////////////////////////////////////////////////////////////// /////////////////////////////////////////////////////////////////////////////////////////////////////
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: TextFieldStyles.textBoxHorizontal,
                        vertical: TextFieldStyles.textBoxVertical),
                    child: FormBuilderPhoneField(
                      textAlign: TextAlign.center,
                      attribute: 'phone_number',
                      //initialValue: '+25443534543567',
                      defaultSelectedCountryIsoCode: 'US',
                      cursorColor: Colors.black,
                      // style: TextStyle(color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone,
                              size: 35.0, color: AppColors.lightblue),
                          contentPadding: EdgeInsets.all(8.0),
                          hintStyle: TextFieldStyles.placeholder,
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.straw,
                                  width: BaseStyles.borderWidth),
                              borderRadius: BorderRadius.circular(
                                  BaseStyles.borderRadius)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.straw,
                                  width: BaseStyles.borderWidth),
                              borderRadius: BorderRadius.circular(
                                  BaseStyles.borderRadius)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.straw,
                                  width: BaseStyles.borderWidth),
                              borderRadius: BorderRadius.circular(
                                  BaseStyles.borderRadius)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.red,
                                  width: BaseStyles.borderWidth),
                              borderRadius: BorderRadius.circular(
                                  BaseStyles.borderRadius)),
                          labelText: 'Add your Phone Number',
                          labelStyle: TextStyles.frontcardtext),
                      onChanged: _onChanged,
                      priorityListByIsoCode: ['US'],
                      validators: [
                        FormBuilderValidators.required(
                            errorText: 'This field required')
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////Gender category////////////////////////////////////////////////////////////////////////
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: TextFieldStyles.textBoxHorizontal,
                        vertical: TextFieldStyles.textBoxVertical),
                    child: FormBuilderRadioGroup(
                      wrapAlignment: WrapAlignment.center,
                      wrapCrossAxisAlignment: WrapCrossAlignment.center,
                      attribute: 'gender',
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8.0),
                        labelText: 'Add Gender Category',
                        labelStyle: TextStyles.cardtext,
                        hintStyle: TextFieldStyles.placeholder,
                      ),
                      onChanged: _onChanged,
                      options: [
                        FormBuilderFieldOption(value: 'M', child: Text('Men')),
                        FormBuilderFieldOption(
                            value: 'F', child: Text('Women')),
                        FormBuilderFieldOption(value: 'K', child: Text('Kids')),
                        FormBuilderFieldOption(
                            value: 'O', child: Text('Other')),
                      ],
                    ),
                  ),
////////////////////////////////Item type //////////////////////////////////////////////////

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: TextFieldStyles.textBoxHorizontal,
                        vertical: TextFieldStyles.textBoxVertical),
                    child: FormBuilderRadioGroup(
                      wrapAlignment: WrapAlignment.center,
                      wrapCrossAxisAlignment: WrapCrossAlignment.center,
                      attribute: 'Item Type',
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8.0),
                        labelText: 'Add  how the Item was made',
                        labelStyle: TextStyles.cardtext,
                        hintStyle: TextFieldStyles.placeholder,
                      ),
                      onChanged: _onChanged,
                      options: [
                        FormBuilderFieldOption(
                            value: 'Handmade', child: Text('Handmade')),
                        FormBuilderFieldOption(
                            value: 'Vintage', child: Text('Vintage')),
                        FormBuilderFieldOption(
                            value: 'All Items', child: Text('All items')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 35),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: TextFieldStyles.textBoxHorizontal,
                vertical: TextFieldStyles.textBoxVertical),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    color: Theme.of(context).accentColor,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_fbKey.currentState.saveAndValidate()) {
                        print(_fbKey.currentState.value);
                      } else {
                        print(_fbKey.currentState.value);
                        print('validation failed');
                      }
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                    child: MaterialButton(
                  color: Theme.of(context).accentColor,
                  child: Text(
                    'Reset',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _fbKey.currentState.reset();
                  },
                )),
              ],
            ),
          ),
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////Botttom Container ////////////////////////////////////////////////////////////////////////
          //bottom container
          SizedBox(height: 35),
          Container(
            height: 420,
            //width: screenSize.width,
            //color: AppColors.darkblue,
            child: BottomNavigator(),
          ),
          Container(
            height: 70,
            //width: screenSize.width / 4,
            color: AppColors.darkgreen,
            child: Footer(),
          ), //bottom container
        ],
      ),
    );
  }
}
