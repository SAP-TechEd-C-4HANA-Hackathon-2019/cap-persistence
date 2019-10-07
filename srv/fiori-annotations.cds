using StoreService from './store-service';

annotate StoreService.Orders with @(
	UI: {
		////////////////////////////////////////////////////////////////////////////
		//
		//	Lists of Orders
		//
		SelectionFields: [ store_ID, createdAt, createdBy ],
		LineItem: [
			{Value: createdBy, Label:'Customer'},
			{Value: store_ID, Label:'Store ID'},
			{Value: ccOrderID, Label:'Order ID'},
			{Value: amount, Label: 'Order Value' },
			{Value: currency },
			{Value: createdAt, Label:'Date'}
		],
		////////////////////////////////////////////////////////////////////////////
		//
		//	Order Details
		//
		HeaderInfo: {
			TypeName: 'Order', TypeNamePlural: 'Orders',
			Title: {
				Label: 'Order number ', //A label is possible but it is not considered on the ObjectPage yet
				Value: ccOrderID
			},
			Description: {Value: createdBy}
		},
		Identification: [ //Is the main field group
			{Value: createdBy, Label:'Customer'},
			{Value: createdAt, Label:'Date'},
			{Value: ccOrderID },
		]
  }
) {
	createdAt @UI.HiddenFilter:false;
	createdBy @UI.HiddenFilter:false;
	amount
		@Common.FieldControl: #ReadOnly
		@Measures.ISOCurrency:currency.code; //Bind the currency field to the amount field
		//In all services we always find currency as the code and not as an object that contains a property code
		//it seems to work but at least to me this is unconventional modeling.
};
