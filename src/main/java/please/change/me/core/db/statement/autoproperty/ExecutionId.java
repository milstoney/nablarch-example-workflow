package please.change.me.core.db.statement.autoproperty;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import nablarch.core.util.annotation.Published;

/**
 * データベース更新時にフィールド情報に実行時IDを設定する事を表すアノテーション。
 * @author Kiyohito Itoh
 * @since 1.1
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Published
public @interface ExecutionId {
}