<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>

    <n:set var="menuForm" value="sampleMenu" ></n:set>
    <n:form name="${menuForm}">
    <n:plainHidden name="${menuForm}"></n:plainHidden>

    <div class="nablarch_TreeMenu
                -name <n:write name='menuForm' />">
      <h3 id="customEvent"
          class="menu_title"><i class="fa fa-cogs fa-lg"></i>カスタムイベント</h3>
      <ul class="menu_folder
                 -title customEvent" >
        <li class="hover">
          <link:submit
            uri="/jsp/サブミットイベント拡張/index.jsp"
            dummyUri="/jsp/サブミットイベント拡張/index.jsp"
            label="">
            <i class='fa fa-bolt'></i>サブミットイベント拡張
          </link:submit>
        </li>
        <li class="hover">
          <link:submit
            uri="/jsp/ダイアログ/index.jsp"
            dummyUri="/jsp/ダイアログ/index.jsp"
            label="">
            <i class='fa fa-bolt'></i>ダイアログ
          </link:submit>
        </li>
        <li class="hover">
          <link:submit
            uri="/jsp/イベント/index.jsp"
            dummyUri="/jsp/イベント/index.jsp"
            label="">
            <i class='fa fa-bolt'></i>イベントFW
          </link:submit>
        </li>
      </ul>

    <h3 id="view"
        class="menu_title"><i class="fa fa-bar-chart-o fa-lg"></i>表示用部品</h3>
      <ul class="menu_folder
                -title view" >
        <li class="hover">
          <link:submit
            uri="/jsp/タブ/index.jsp"
            dummyUri="/jsp/タブ/index.jsp"
            label="">
            <i class='fa fa-folder'></i>タブ
          </link:submit>
        </li>
        <li class="hover">
          <link:submit
            uri="/jsp/開閉可能領域/index.jsp"
            dummyUri="/jsp/開閉可能領域/index.jsp"
            label="">
            <i class='fa fa-expand'></i>開閉可能領域
          </link:submit>
        </li>
        <li class="hover">
          <link:submit
              uri="/jsp/テーブル/index.jsp"
              dummyUri="/jsp/テーブル/index.jsp"
              label="">
            <i class='fa fa-table'></i>テーブル
          </link:submit>
        </li>
        <li class="hover">
          <link:submit
            uri="/jsp/ツリーリスト/index.jsp"
            dummyUri="/jsp/ツリーリスト/index.jsp"
            label="">
            <i class='fa fa-sort-amount-desc'></i>ツリーリスト
          </link:submit>
        </li>
        <li class="hover">
          <link:submit
            uri="/jsp/ツリーメニュー/ツリーメニュー.jsp"
            dummyUri="/jsp/ツリーメニュー/ツリーメニュー.jsp"
            label="">
            <i class='fa fa-sort-amount-desc'></i>ツリーメニュー
          </link:submit>
        </li>
        <li class="hover">
          <link:submit
              uri="/jsp/ボタン/index.jsp"
              dummyUri="/jsp/ボタン/index.jsp"
              label="">
            <i class='fa fa-square-o'></i>ボタン
          </link:submit>
        </li>
        <li class="hover">
          <link:submit
              uri="/jsp/リンク/index.jsp"
              dummyUri="/jsp/リンク/index.jsp"
              label="">
            <i class='fa fa-link'></i>リンク
          </link:submit>
        </li>
        <li class="hover">
          <link:submit
              uri="/jsp/テンプレート拡張/index.jsp"
              dummyUri="/jsp/テンプレート拡張/index.jsp"
              label="">
            <i class='fa fa-star-half-empty'></i>テンプレート拡張
          </link:submit>
        </li>
        <li class="hover">
          <link:submit
              uri="/jsp/サブウィンドウ/index.jsp"
              dummyUri="/jsp/サブウィンドウ/index.jsp"
              label="">
            <i class='fa fa-search'></i>子画面テンプレート
          </link:submit>
        </li>
        <li class="hover">
          <link:submit
              uri="/jsp/マルチカラムレイアウト/index.jsp"
              dummyUri="/jsp/マルチカラムレイアウト/index.jsp"
              label="">
            <i class='fa fa-desktop'></i>マルチカラムテンプレート
          </link:submit>
        </li>
        <li class="hover">
          <link:submit
              uri="/jsp/ボックス/index.jsp"
              dummyUri="/jsp/ボックス/index.jsp"
              label="">
            <i class='fa fa-file-text-o'></i>ボックス
          </link:submit>
        </li>

      </ul>
      <h3 id="buttonLinks"
          class="menu_title
                 menu_folder
                 -title view"><i class='fa fa-square-o'></i>ボタンショートカット</h3>
      <ul class="menu_folder
                 -title buttonLinks">
          <li class="hover"><link:submit uri="/jsp/ボタン・リンク/検索ボタン.jsp" dummyUri="/jsp/ボタン・リンク/検索ボタン.jsp" label="検索"/></li>
      </ul>
      <h3 id="buttonLinks_back"
          class="menu_title
                 menu_folder
                 -title buttonLinks
                 sub_folder"><i class='fa fa-square-o'></i>戻るタイプ</h3>
      <ul class="menu_folder
                 -title buttonLinks_back
                 sub_folder">
          <li class="hover"><link:submit uri="/jsp/ボタン・リンク/戻るボタン.jsp" dummyUri="/jsp/ボタン・リンク/戻るボタン.jsp" label="戻るボタン"/></li>
          <li class="hover"><link:submit uri="/jsp/ボタン・リンク/キャンセルボタン.jsp" dummyUri="/jsp/ボタン・リンク/キャンセルボタン.jsp" label="キャンセルボタン"/></li>
      </ul>
      <h3 id="buttonLinks_update"
          class="menu_title
                 menu_folder
                 -title buttonLinks
                 sub_folder"><i class='fa fa-square-o'></i>更新するタイプ</h3>
       <ul class="menu_folder
                 -title buttonLinks_update
                 sub_folder">
          <li class="hover"><link:submit uri="/jsp/ボタン・リンク/確認ボタン.jsp" dummyUri="/jsp/ボタン・リンク/確認ボタン.jsp" label="確認ボタン"/></li>
          <li class="hover"><link:submit uri="/jsp/ボタン・リンク/確定ボタン.jsp" dummyUri="/jsp/ボタン・リンク/確定ボタン.jsp" label="確定ボタン"/></li>
          <li class="hover"><link:submit uri="/jsp/ボタン・リンク/削除ボタン.jsp" dummyUri="/jsp/ボタン・リンク/削除ボタン.jsp" label="削除ボタン"/></li>

       </ul>
      <h3 id="input"
           class="menu_title"><i class="fa fa-edit fa-lg"></i>入力用部品</h3>
      <ul class="menu_folder
                 -title input" >
        <li class="hover">
          <link:submit
            uri="/jsp/リストビルダー/index.jsp"
            dummyUri="/jsp/リストビルダー/index.jsp"
            label="">
            <i class='fa fa-columns'></i>リストビルダー
          </link:submit>
        </li>
        <li class="hover">
          <link:submit
            uri="/jsp/変更不可項目/index.jsp"
            label="">
            <i class='fa fa-lock'></i>変更不可項目
          </link:submit>
        </li>
        <li class="hover">
          <link:submit
            uri="/jsp/自動集計/index.jsp"
            label="">
            <i class='fa fa-yen'></i>自動集計
          </link:submit>
        </li>
        <li class="hover">
          <link:submit
            uri="/jsp/カレンダー日付入力/index.jsp"
            dummyUri="/jsp/カレンダー日付入力/index.jsp"
            label="">
            <i class='fa fa-calendar'></i>カレンダー日付入力
          </link:submit>
        </li>
        <li class="hover">
          <link:submit
            uri="/jsp/プレースホルダー/index.jsp"
            label="">
            <i class='fa fa-terminal'></i>プレースホルダー
          </link:submit>
        </li>
        <li class="hover">
          <link:submit
              uri="/jsp/ファイルアップロード/index.jsp"
              dummyUri="/jsp/ファイルアップロード/index.jsp"
              label="">
            <i class='fa fa-upload'></i>ファイルアップロード
          </link:submit>
        </li>
        <li class="hover">
          <link:submit
            uri="/jsp/その他のウィジェット/index.jsp"
            dummyUri="/jsp/その他のウィジェット/index.jsp"
            label="">
            <i class='fa fa-plus'></i>その他のウィジェット
          </link:submit>
        </li>
      </ul>
      <h3 id="other"
          class="menu_title"><i class="fa fa-group fa-lg"></i>その他</h3>
      <ul class="menu_folder -title other" >
        <li class="hover">
          <link:submit
            uri="/jsp/スペックタグ/単体テスト.jsp"
            dummyUri="/jsp/スペックタグ/単体テスト.jsp"
            label="">
            <i class='fa fa-file-text'></i>スペックタグの影響
          </link:submit>
        </li>
        <li class="hover">
          <link:submit uri="/jsp/動作環境適合/index.jsp"
                       dummyUri="/jsp/動作環境適合/index.jsp"
                       label="">
            <i class='fa fa-mobile'></i>動作環境適合
          </link:submit>
        </li>

        <li class="hover">
          <link:submit uri="javascript:alert('server動作では確認できません。')"
                       dummyUri="/jsp/フォーム自動生成/FormGeneratorTest.jsp"
                       label="">
            <i class='fa fa-files-o'></i>フォーム自動生成
          </link:submit>
        </li>

        <li class="hover">
          <link:submit uri="javascript:alert('server動作では確認できません。')"
                       dummyUri="/jsp/画面設計書/index.jsp"
                       label="">
            <i class='fa fa-paperclip'></i>設計書確認
          </link:submit>
        </li>
        <li class="hover">
          <link:submit uri="/jsp/js_index.jsp"
                       dummyUri="javascript:alert('ローカルでは確認できません')"
                       label="">
            <i class='fa fa-fire'></i>jsのテストの確認
          </link:submit>
        </li>
      </ul>
      <h3 id="tutorial"
          class="menu_title"><i class="fa fa-sun-o"></i>tutorial plugin</h3>
        <ul>
          <li class="hover">
            <link:submit uri="/jsp/field.jsp"
                dummyUri="/jsp/field.jsp"
                label="">
              <i class='fa fa-file-text-o'></i>入力部品系
            </link:submit>
          </li>
        </ul>
      </h3>
    </div>
    </n:form>