//describe('MoviePopupJson', function() {
//  describe('setup', function() {
//    it('adds popup Div to main page', function() {
//      expect($('#movieInfo')).toExist();
//    });
//    it('hides the popup Div', function() {
//      expect($('#movieInfo')).toBeHidden();
//    });
//  });
//  describe('successful AJAX call', function() {
//    beforeEach(function() {
//      loadFixtures('movie_row.html');
//      var jsonResponse = getJSONFixture('movie_info.json');
//      spyOn($, 'ajax').and.callFake(function(ajaxArgs) {
//        ajaxArgs.success(jsonResponse, '200');
//      });
//      $('#movies a').trigger('click');
//    });
//    // 'it' clauses are same as in movie_popup_spec.js
//  });
//});
