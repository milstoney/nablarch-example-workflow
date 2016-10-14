runTest(
  require属性のテスト
  , hint属性のテスト
  , readonly属性のテスト
  , disabled属性のテスト
  , cssClass属性のテスト
  , sample属性のテスト
  , listFormat属性のテスト
  , size属性のテスト
  , pattern属性のテスト
  , optionColumnName属性のテスト
  , labelPattern属性のテスト
);

var $all_nodes;

function setup() {
  $all_nodes = $('span.test-case, div.field.checkboxes, div.fielderror, div.note');
}

function require属性のテスト() {
  setup();
  var cases = test_for('required-test')
    ,  default_case = cases[0]
    ,  blank_case   = cases[1]
    ,  false_case   = cases[2]
    ,  true_case    = cases[3]
    ,  required     = 'span.required'
    ,  assertHas    = function(testcase) {
      if(isConfirmationPage()) { assertNotHas(testcase);
      } else{
        equal(testcase.area.find(required).size(), 1, testcase.testcase);
        equal($.trim(testcase.area.find(required).text()), '*', testcase.testcase);
      }
    }
    , assertNotHas  = function(testcase) {
      equal(testcase.area.find(required).size(), 0, testcase.testcase);
    };

  assertNotHas(default_case);
  assertNotHas(blank_case);
  assertNotHas(false_case);
  assertHas(true_case);
}

function hint属性のテスト() {
  setup();
  var cases = test_for('hint-test')
    , default_case  = cases[0]
    , blank_case    = cases[1]
    , set_hint_case = cases[2]
    , assertHasHint = function(testcase) {
      isConfirmationPage() ? equal(testcase.hint.size(), 0, testcase.testcase)
        : equal(testcase.hint.size(), 1, testcase.testcase);
    }
    , assertHasNotHint = function(testcase) {
      equal(testcase.hint.size(), 0, testcase.testcase);
    };

  assertHasNotHint(default_case);
  assertHasNotHint(blank_case);
  assertHasHint(set_hint_case);
}

function readonly属性のテスト() {
  setup();
  var cases = test_for('readonly-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , true_case    = cases[2]
    , false_case   = cases[3]
    , assertText   = function (testcase, values) {
      var text = testcase.area.find('div.field-content').html().replace(/&nbsp;/g, ' ').trim()
        , datalist = text.split(/\s/);
      $.each(datalist, function(i, e) {
        equal(e, values[i], testcase.testcase);
      });
    }
    , assertValues = function(testcase, values) {
      return function(i, e) {
        equal($(this).val(), values[i], testcase.testcase);
      };
    }
    , assertReadOnly = function(testcase, values) {
      var $input = testcase.area.find('input:checkbox');
      equal($input.size(), 3, testcase.testcase + "[input size]");
      $input.each(assertValues(testcase, values))
        .each(function(){
          ok($(this).prop('disabled'), testcase.testcase +  "[prop disabled]");
          ok($(this).is('.nablarch_readonly'), testcase.testcase + "[marker readonly]");
        });
    }
    , assertNotReadOnly = function(testcase, values) {
      var $input = testcase.area.find('input:checkbox');
      equal($input.size(), 3, testcase.testcase + "[input size]");
      $input.each(assertValues(testcase, values))
        .each(function(){
          ok(!$(this).prop('disabled'), testcase.testcase +  "[prop disabled]");
          ok(!$(this).is('.nablarch_readonly'), testcase.testcase + "[marker readonly]");
        });
    }
    , values = ["value1-1", "value1-2", "value1-3"]
    , labels = ["name1-1", "name1-2", "name1-3"];

  if (isConfirmationPage()) {
    assertText(default_case, labels);
    assertText(blank_case, labels);
    assertText(true_case, labels);
    assertText(false_case, labels);
  } else {
    assertNotReadOnly(default_case, values);
    assertNotReadOnly(blank_case, values);
    assertReadOnly(true_case, values);
    assertNotReadOnly(false_case, values);
  }
}

function disabled属性のテスト() {
  setup();
  var cases = test_for('disabled-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , true_case    = cases[2]
    , false_case   = cases[3]
    , assertText   = function (testcase, values) {
      var text = testcase.area.find('div.field-content').html().replace(/&nbsp;/g, ' ').trim()
        , datalist = text.split(/\s/);
      $.each(datalist, function(i, e) {
        equal($.trim(e), values[i], testcase.testcase);
      });
    }
    , assertValues = function(testcase, values) {
      return function(i, e) {
        equal($(this).val(), values[i], testcase.testcase);
      };
    }
    , assertDisabled = function(testcase, values) {
      var $input = testcase.area.find('input:checkbox');
      equal($input.size(), 3, testcase.testcase + "[input size]");
      $input.each(assertValues(testcase, values))
        .each(function(){
          ok($(this).prop('disabled'), testcase.testcase +  "[prop disabled]");
        });
    }
    , assertNotDisabled = function(testcase, values) {
      var $input = testcase.area.find('input:checkbox');
      equal($input.size(), 3, testcase.testcase + "[input size]");
      $input.each(assertValues(testcase, values))
        .each(function(){
          ok(!$(this).prop('disabled'), testcase.testcase +  "[prop disabled]");
        });
    }
    , values = ["value1-1", "value1-2", "value1-3"]
    , labels = ["name1-1", "name1-2", "name1-3"];

  if (isConfirmationPage()) {
    assertText(default_case, labels);
    assertText(blank_case, labels);
    assertText(true_case, [""]);
    assertText(false_case, labels);
  } else {
    assertNotDisabled(default_case, values);
    assertNotDisabled(blank_case, values);
    assertDisabled(true_case, values);
    assertNotDisabled(false_case, values);
  }
}

function cssClass属性のテスト() {
  // 入力画面のみ検証
  if(isConfirmationPage()) { return ok(true, "確認画面ではテスト無し");}

  setup();
  var cases = test_for('cssClass-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2];

  equal(default_case.area.find('input:checkbox').size(), 3, default_case.testcase);
  equal(default_case.area.find('input:checkbox.cssClass-test').size(), 0, default_case.testcase);

  equal(blank_case.area.find('input:checkbox').size(), 3, blank_case.testcase);
  equal(blank_case.area.find('input:checkbox.cssClass-test').size(), 0, blank_case.testcase);

  equal(set_case.area.find('input:checkbox.cssClass-test').size(), 3, set_case.testcase);
}

function sample属性のテスト() { // server にて出力される場合は無効であることを確認する。
  setup();
  var cases = test_for('sample-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2]
    , multi_select = cases[3]
    , assertBlankText = function(testcase) {
      var text = testcase.area.find('div.field-content').text();
      ok(text.isBlank(), testcase.testcase);
    }
    , assert       = function(testcase) {
      if (isConfirmationPage()) {return assertBlankText(testcase);}

      var $nodes = testcase.area.find('div.field-content').find(':checkbox')
        , values = ["value1-1", "value1-2", "value1-3"]
        , text = $.trim(testcase.area.find('div.field-content').text())
        , label = ["name1-1", "name1-2", "name1-3"].join("\xA0");
      $nodes.each(function(i, e){
        equal($(this).val(), values[i], testcase.testcase);
      });
      equal(text, label, testcase.testcase);
    };

  assert(default_case);
  assert(blank_case);
  assert(set_case);
  assert(multi_select);
}

function listFormat属性のテスト() {

  setup();
  var cases = test_for('listFormat-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , br_case      = cases[2]
    , div_case     = cases[3]
    , ul_case      = cases[4]
    , ol_case      = cases[5]
    , span_case    = cases[6]
    , sp_case      = cases[7]
    , values = ["value1-1", "value1-2", "value1-3"]
    , labels = ["name1-1", "name1-2", "name1-3"]
    , assertValuesFormat = function(testcase, formatSpec, values) { // 入力画面ではformat内にcheckboxがあることで検証
      var $input = testcase.area.find('div.field-content').find(formatSpec).find('input:checkbox');
      equal($input.size(), values.length, testcase.testcase + " formatspec = " + formatSpec);
      $input.each(function(i, e){
        equal($(this).val(), values[i], testcase.testcase);
      });
    }
    , assertLabelFormat = function(testcase, formatSpec, labels){ //確認画面ではformatの中にlabelのテキストがあることで検証する。
      var $labels = testcase.area.find('div.field-content').find(formatSpec);
      equal($labels.size(), labels.length, testcase.testcase);
      $labels.each(function(i, e){
        var text = $.trim($(e).text());
        equal(text, labels[i], testcase.testcase);
      });
    }
    , assertTextFormat = function (testcase, formatSpec ,labels) {
      var fieldInput = testcase.area.find('div.field-content').clone()
        , nodes;

      fieldInput.find('div.fielderror').remove();
      nodes = fieldInput.html().trim().toLocaleLowerCase().split(formatSpec).remove("");
      equal(nodes.length, labels.length, testcase.testcase);
      $.each(nodes, function(i, htmltext){
        if(isConfirmationPage()) {
          ok(htmltext.match('^\\s*' + labels[i] + '\\s*$'), testcase.testcase);
        } else {
          ok(htmltext.match('^\\s*<input.+<\/label>\\s*$'), testcase.testcase);
        }
      });
    };

  if (isConfirmationPage()) {
    assertLabelFormat(default_case, "span", labels);
    assertLabelFormat(blank_case, "span", labels);
    assertTextFormat(br_case, "<br>",labels);
    assertLabelFormat(div_case, "div", labels);
    assertLabelFormat(span_case, "span", labels);
    assertLabelFormat(ul_case, "ul > li", labels);
    assertLabelFormat(ol_case, "ol > li", labels);
    assertTextFormat(sp_case,"&nbsp;" ,labels);
  } else {
    assertValuesFormat(default_case, "span", values);
    assertValuesFormat(blank_case, "span", values);
    assertTextFormat(br_case, "<br>",labels);
    assertValuesFormat(div_case, "div", values);
    assertValuesFormat(span_case, "span", values);
    assertValuesFormat(ul_case, "ul > li", values);
    assertValuesFormat(ol_case, "ol > li", values);
    assertTextFormat(sp_case,"&nbsp;" ,labels);
  }
}

function size属性のテスト() {
  setup();

  var cases = test_for('size-test'),
    assertNotSizeClass = function(testCase) {
      var label = testCase.area.find('label'),
        fieldContent = testCase.area.find('div.field-content');

      ok(!label.attr('class').has('grid-col'), testCase.testcase);
      ok(!fieldContent.attr('class').has('grid-col'), testCase.testcase);
    },
    assertSize = function(testCase) {
      var label = testCase.area.find('label'),
        fieldContent = testCase.area.find('div.field-content');

      ok(label.hasClass('grid-col-8'), testCase.testcase);
      ok(fieldContent.hasClass('grid-col-12'), testCase.testcase);
    };

  assertNotSizeClass(cases[0]);     // size属性指定なし
  assertNotSizeClass(cases[1]);     // size属性ブランク指定
  assertSize(cases[2]);             // size属性を指定
}

/**
 * pattern属性のテスト
 */
function pattern属性のテスト() {
  var pattern1 = [
      {label: 'name1-1', value: 'value1-1'},
      {label: 'name1-2', value: 'value1-2'},
      {label: 'name1-3', value: 'value1-3'}
    ]
    , pattern2 = [
      {label: 'name1-2', value: 'value1-2'}
    ]
    , assert = function (testCase, expected) {
      var target = findTest(testCase)
        , $checkboxes = target.input.find('input:checkbox');

      if (isConfirmationPage()) {
        equal(target.input.text().compact(), expected.map(function (val) {
          return val.label
        }).join(''), 'divのボディ部に入力値が表示されていること');
      } else {
        expected.each(function (code, index) {
          var $checkbox = $($checkboxes[index])
            , label = $checkbox.next('label').text().trim();

          equal(label, code.label, target.testCase + ': ラベル表示が正しいこと');
          equal($checkbox.val(), code.value, target.testCase + ': value属性が正しいこと');
        });
      }
    };

  assert('pattern-none', pattern1);
  assert('pattern-blank', pattern1);
  assert('pattern-not-blank', pattern2);
}

/**
 * optionColumnName属性のテスト
 */
function optionColumnName属性のテスト() {
  var defaultOption = [
      {label: 'name1-1 column:OPTION01', value: 'value1-1'},
      {label: 'name1-2 column:OPTION01', value: 'value1-2'},
      {label: 'name1-3 column:OPTION01', value: 'value1-3'}
    ]
    , specifiedOption = [
      {label: 'name1-1 column:OPTION03', value: 'value1-1'},
      {label: 'name1-2 column:OPTION03', value: 'value1-2'},
      {label: 'name1-3 column:OPTION03', value: 'value1-3'}
    ]
    , assert = function (testCase, expected) {
      var target = findTest(testCase)
        , $checkboxes = target.input.find('input:checkbox');

      if (isConfirmationPage()) {
        equal(target.input.text().compact(), expected.map(function (val) {
          return val.label
        }).join(''), 'divのボディ部に入力値が表示されていること');
      } else {
        expected.each(function (code, index) {
          var $checkbox = $($checkboxes[index])
            , label = $checkbox.next('label').text().compact();

          equal(label, code.label, target.testCase + ': ラベル表示が正しいこと');
          equal($checkbox.val(), code.value, target.testCase + ': value属性が正しいこと');
        });

      }
    }
    ;

  assert('option-none', defaultOption);
  assert('option-blank', defaultOption);
  assert('option-not-blank', specifiedOption);
}

/**
 * labelPattern属性のテスト
 */
function labelPattern属性のテスト() {
  var defaultLabel = [
      {label: 'name1-1', value: 'value1-1'},
      {label: 'name1-2', value: 'value1-2'},
      {label: 'name1-3', value: 'value1-3'}
    ]
    , specifiedPattern = [
      {label: 'name1-1 - short:name1-1 - name1-1 column:OPTION03 - value1-1', value: 'value1-1'},
      {label: 'name1-2 - short:name1-2 - name1-2 column:OPTION03 - value1-2', value: 'value1-2'},
      {label: 'name1-3 - short:name1-3 - name1-3 column:OPTION03 - value1-3', value: 'value1-3'}
    ]
    , assert = function (testCase, expected) {
      var target = findTest(testCase)
        , $checkboxes = target.input.find('input:checkbox');

      if (isConfirmationPage()) {
        equal(target.input.text().compact(), expected.map(function (val) {
          return val.label
        }).join(''), 'divのボディ部に入力値が表示されていること');
      } else {
        expected.each(function (code, index) {
          var $checkbox = $($checkboxes[index])
            , label = $checkbox.next('label').text().compact();

          equal(label, code.label, target.testCase + ': ラベル表示が正しいこと');
          equal($checkbox.val(), code.value, target.testCase + ': value属性が正しいこと');
        });
      }
    };

  assert('labelPattern-none', defaultLabel);
  assert('labelPattern-blank', defaultLabel);
  assert('labelPattern-not-blank', specifiedPattern);
}

/**
 * 単行テキストのwidgetから出力されたテストケースの情報を取得する。
 * @param case_id テストケースのID
 * @returns テストケース内に定義された確認ボタン
 */
function test_for(case_id) {
  var $cases = $all_nodes.filter('span.test-case.' + case_id);
  return $cases.map(function() {
    var $e = $(this)
      ,  idx   = $all_nodes.index($e)
      ,  $area = $($all_nodes[idx + 1])
      ,  $options = $all_nodes.filter(':eq(' + (idx + 2) + '), :eq(' + (idx + 3) + ')')
      ,  error    = $options.filter('div.fielderror')
      ,  note     = $options.filter('div.note');
    return {
      testcase : $.trim($e.text()),
      area     : $area,
      error    : error,
      hint     : note
    };
  });
}

function findTest(testCase) {
  var $test = $('span.test-case.' + testCase)
    , $text_div = $test.next('.field.checkboxes');

  return {
    testCase: $test.text(),
    label   : $text_div.children('label'),
    input   : $text_div.find('div.field-content'),
    error   : $text_div.find('div.fielderror')
  }
}
