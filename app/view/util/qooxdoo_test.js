makeNew = function(obj, params, scope, action){
  var _ = {};
  
  console.clear();
  _.keyArray = Object.keys(params);
  
  for(i=0;i<_.keyArray.length;i++){
    _.thisKey = _.keyArray[i];
    _.thisValue = params[_.thisKey];
    obj[_.thisKey](_.thisValue);
  }
  
  scope.getRoot().add(obj, {left: 20, top: 50});
  
  if(action && action == 'open') {
    obj.open();
  }
  
  return obj;
};

var layout = new qx.ui.layout.Grid(9, 5);
layout.setColumnAlign(0, "right", "top");
layout.setColumnAlign(2, "right", "top");
layout.setColumnWidth(1, 160);
layout.setColumnWidth(2, 72);
layout.setColumnWidth(3, 108);


var container = new qx.ui.tabview.TabView();

var newPage = new qx.ui.tabview.Page("Page");

var page = makeNew(newPage,{
  setLayout: layout,
  setPadding: 10
  }, 
this);


// page.setLayout(layout);
// page.setPadding(10);
container.add(page);

this.getRoot().add(container, {left:40, top:40});

labels = ["First Name", "Last Name", "City", "Country", "Notes"];
for (var i=0; i < labels.length; i++) {
  page.add(new qx.ui.basic.Label(labels[i]).set({
    allowShrinkX: false,
    paddingTop: 3
  }), {row: i, column : 0});
}

inputs = ["John", "Smith", "New York", "USA"];
for (var i=0; i < inputs.length; i++) {
  page.add(new qx.ui.form.TextField(inputs[i]), {row:i, column:1});
}


// text area
page.add(new qx.ui.form.TextArea().set({
  height: 250
}), {row:4, column:1, colSpan: 3});


// radio buttons
page.add(new qx.ui.basic.Label("Sex").set({
  allowShrinkX: false,
  paddingTop: 3
}), {row:0, column:2});

var female = new qx.ui.form.RadioButton("female");
var male = new qx.ui.form.RadioButton("male");

var mgr = new qx.ui.form.RadioGroup();
mgr.add(female, male);

page.add(female, {row:0, column:3});
page.add(male, {row:1, column:3});
male.setValue(true);


// check boxes
page.add(new qx.ui.basic.Label("Hobbies").set({
  allowShrinkX: false,
  paddingTop: 3
}), {row:2, column:2});
page.add(new qx.ui.form.CheckBox("Reading"), {row:2, column:3});
page.add(new qx.ui.form.CheckBox("Swimming").set({
  enabled: false
}), {row:3, column:3});


// buttons
var paneLayout = new qx.ui.layout.HBox().set({
  spacing: 4,
  alignX : "right"
});
var buttonPane = new qx.ui.container.Composite(paneLayout).set({
  paddingTop: 11
});
page.add(buttonPane, {row:5, column: 0, colSpan: 4});

okButton = new qx.ui.form.Button("OK");
okButton.addState("default");
buttonPane.add(okButton);

cancelButton = new qx.ui.form.Button("Cancel");
buttonPane.add(cancelButton);


// HERE //



var win = new qx.ui.window.Window("First Window");
var win2 = new qx.ui.window.Window("Second Window").set({
  width: 250,
  height: 300, 
  showStatusbar: true, 
  allowMinimize: true, 
  allowMaximize: true, 
  modal: false, 
  allowClose: true, 
  showMinimize: true, 
  showMaximize: true, 
  showClose: true
});

var win3 = new qx.ui.window.Window("Third Window").set({
  width: 400,
  height: 500, 
  showStatusbar: false, 
  allowMinimize: false, 
  allowMaximize: false, 
  modal: false, 
  allowClose: true, 
  showMinimize: false, 
  showMaximize: false, 
  showClose: true
});


win2.open();
win3.open();






makeNew(win,{
  setWidth: 300,
  setHeight: 200, 
  setShowStatusbar: true, 
  setAllowMinimize: true, 
  setAllowMaximize: true, 
  setModal: false, 
  setAllowClose: true, 
  setShowMinimize: true, 
  setShowMaximize: true, 
  setShowClose: true
  }, this, 'open');

