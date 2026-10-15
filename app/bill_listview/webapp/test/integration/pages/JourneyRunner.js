sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"billlistview/test/integration/pages/BillList.gen",
	"billlistview/test/integration/pages/BillObjectPage.gen"
], function (JourneyRunner, BillListGenerated, BillObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('billlistview') + '/test/flpSandbox.html#billlistview-tile',
        pages: {
			onTheBillListGenerated: BillListGenerated,
			onTheBillObjectPageGenerated: BillObjectPageGenerated
        },
        async: true
    });

    return runner;
});

