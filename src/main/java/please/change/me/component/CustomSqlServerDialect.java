package please.change.me.component;

import nablarch.core.db.dialect.SqlServerDialect;

/**
 * SQL Serverでシーケンスを使えるようにするための拡張実装。
 * 
 * @author nabchan
 */
public class CustomSqlServerDialect extends SqlServerDialect {

    @Override
    public boolean supportsSequence() {
        return true;
    }

    @Override
    public String buildSequenceGeneratorSql(final String sequenceName) throws UnsupportedOperationException {
        return "SELECT NEXT VALUE FOR " + sequenceName;
    }
}
