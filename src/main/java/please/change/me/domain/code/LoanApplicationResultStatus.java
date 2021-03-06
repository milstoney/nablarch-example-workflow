package please.change.me.domain.code;

/**
 * ローン申請の処理結果ステータス。
 *
 * @author nabchan
 */
public enum LoanApplicationResultStatus implements Code {

    /** 申請完了 */
    OK("完了"),
    /** 却下 */
    REJECTION("却下"),
    /** 差し戻し */
    BACK("差し戻し");

    /** ラベル */
    private final String label;

    /**
     * コンストラクタ。
     * @param label ラベル
     */
    LoanApplicationResultStatus(final String label) {
        this.label = label;
    }

    @Override
    public String getLabel() {
        return label;
    }

    @Override
    public String getValue() {
        return name();
    }
}
