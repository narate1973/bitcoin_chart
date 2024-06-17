
extension ElementAtOrNull<E> on List<E> {
  E? at(int index) {
    if (index < 0 || index >= length) return null;
    return elementAt(index);
  }
}

String convertHtmlUnescape(String html) {
  ///HtmlUnescape().convert this does not work on euro
  return html
  .replaceAll('&#36;', '\$')
      .replaceAll('&amp;', '&')
      .replaceAll('&lt;', '<')
      .replaceAll('&gt;', '>')
      .replaceAll('&quot;', '"')
      .replaceAll('&#39;', "'")
      .replaceAll('&nbsp;', ' ')
      .replaceAll('&ldquo;', '“')
      .replaceAll('&rdquo;', '”')
      .replaceAll('&lsquo;', '‘')
      .replaceAll('&rsquo;', '’')
      .replaceAll('&hellip;', '…')
      .replaceAll('&mdash;', '—')
      .replaceAll('&ndash;', '–')
      .replaceAll('&copy;', '©')
      .replaceAll('&reg;', '®')
      .replaceAll('&trade;', '™')
      .replaceAll('&euro;', '€')
      .replaceAll('&pound;', '£')
      .replaceAll('&yen;', '¥')
      .replaceAll('&cent;', '¢')
      .replaceAll('&brvbar;', '¦')
      .replaceAll('&sect;', '§')
      .replaceAll('&para;', '¶')
      .replaceAll('&middot;', '·')
      .replaceAll('&bull;', '•')
      .replaceAll('&hellip;', '…')
      .replaceAll('&prime;', '′')
      .replaceAll('&Prime;', '″')
      .replaceAll('&frasl;', '⁄')
      .replaceAll('&deg;', '°')
      .replaceAll('&permil;', '‰')
      .replaceAll('&micro;', 'µ')
      .replaceAll('&plusmn;', '±')
      .replaceAll('&sup1;', '¹')
      .replaceAll('&sup2;', '²')
      .replaceAll('&sup3;', '³')
      .replaceAll('&frac14;', '¼')
      .replaceAll('&frac12;', '½')
      .replaceAll('&frac34;', '¾')
      .replaceAll('&iquest;', '¿')
      .replaceAll('&iexcl;', '¡')
      .replaceAll('&laquo;', '«')
      .replaceAll('&raquo;', '»')
      .replaceAll('&not;', '¬')
      .replaceAll('&macr;', '¯')
      .replaceAll('&uml;', '¨')
      .replaceAll('&acute;', '´')
      .replaceAll('&cedil;', '¸')
      .replaceAll('&ordm;', 'º')
      .replaceAll('&ordf;', 'ª')
      .replaceAll('&times;', '×')
      .replaceAll('&divide;', '÷');
}