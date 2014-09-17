// ========================== KeySnail Init File =========================== //

// You can preserve your code in this area when generating the init file using GUI.
// Put all your code except special key, set*key, hook, blacklist.
// ========================================================================= //
//{{%PRESERVE%
// Put your codes here
//}}%PRESERVE%
// ========================================================================= //

// ========================= Special key settings ========================== //

key.quitKey              = "C-g";
key.helpKey              = "<f1>";
key.escapeKey            = "C-q";
key.macroStartKey        = "<f3>";
key.macroEndKey          = "<f4>";
key.suspendKey           = "<f2>";
// key.universalArgumentKey = "C-u";
key.negativeArgument1Key = "C--";
key.negativeArgument2Key = "C-M--";
key.negativeArgument3Key = "M--";

// ================================= Hooks ================================= //

hook.addToHook('KeyBoardQuit', function (aEvent) {
  if (key.currentKeySequence.length)
    return;

  command.closeFindBar();

  let marked = command.marked(aEvent);

  if (util.isCaretEnabled())
  {
    if (marked)
    {
      command.resetMark(aEvent);
    }
    else
    {
      if ("blur" in aEvent.target) aEvent.target.blur();

      gBrowser.focus();
      _content.focus();
    }
  }
  else
  {
    goDoCommand("cmd_selectNone");
  }

  if (KeySnail.windowType === "navigator:browser" && !marked)
  {
    key.generateKey(aEvent.originalTarget, KeyEvent.DOM_VK_ESCAPE, true);
  }
});

// ============================= Key bindings ============================== //

key.setGlobalKey("C-t", function () {
  document.getElementById("cmd_newNavigatorTab").doCommand();
}, "Open the new tab");

key.setGlobalKey('C-l', function (ev) {
  command.focusToById("urlbar");
}, 'focus to location bar', true);

key.setGlobalKey('C-k', function (ev) {
  command.focusToById("searchbar");
}, 'focus to search bar', true);

key.setGlobalKey('M-x', function (ev, arg) {
  ext.select(arg, ev);
}, 'List exts and execute selected one', true);

key.setGlobalKey('M-:', function (ev) {
  command.interpreter();
}, 'Command interpreter', true);

key.setGlobalKey('M-w', function (ev) {
  command.copyRegion(ev);
}, 'Copy selected text', true);

key.setGlobalKey('C-s', function (ev) {
  command.iSearchForwardKs(ev);
}, 'Emacs like incremental search forward', true);

key.setGlobalKey('C-w', function (ev) {
  BrowserCloseTabOrWindow();
}, 'Close tab / window', false);

key.setGlobalKey(["C-x", "C-c"], function (ev) {
  goQuitApplication();
}, 'Exit Firefox', true);

key.setGlobalKey(["C-x", "C-f"], function (ev) {
  BrowserOpenFileWindow();
}, 'Open the local file', true);

key.setGlobalKey(["C-x", "C-s"], function (ev) {
  saveDocument(window.content.document);
}, 'Save current page to the file', true);

// edit
key.setEditKey(["C-x", "h"], function (ev) {
  command.selectAll(ev);
}, 'Select whole text', true);

key.setEditKey([["C-SPC"], ["C-@"]], function (ev) {
  command.setMark(ev);
}, 'Set the mark', true);

key.setEditKey('C-/', function (ev) {
  display.echoStatusBar("Undo!", 2000);
  goDoCommand("cmd_undo");
}, 'Undo', false);

key.setEditKey('C-a', function (ev) {
  command.beginLine(ev);
}, 'Beginning of the line', false);

key.setEditKey('C-e', function (ev) {
  command.endLine(ev);
}, 'End of the line', false);

key.setEditKey('C-f', function (ev) {
  command.nextChar(ev);
}, 'Forward char', false);

key.setEditKey('C-b', function (ev) {
  command.previousChar(ev);
}, 'Backward char', false);

key.setEditKey('C-p', function (ev) {
  command.previousLine(ev);
}, 'Previous line', false);

key.setEditKey('C-v', function (ev) {
  command.pageDown(ev);
}, 'Page down', false);

key.setEditKey('C-d', function (ev) {
  goDoCommand("cmd_deleteCharForward");
}, 'Delete forward char', false);

key.setEditKey('C-k', function (ev) {
  command.killLine(ev);
}, 'Kill the rest of the line', false);

key.setEditKey('C-y', command.yank, 'Paste (Yank)', false);

// view
key.setViewKey([':', 'b'], function (ev, arg) {
  ext.exec("bmany-list-all-bookmarks", arg, ev);
}, 'bmany - List all bookmarks');

key.setViewKey([':', 'B'], function (ev, arg) {
  ext.exec("bmany-list-bookmarklets", arg, ev);
}, "bmany - List all bookmarklets");

key.setViewKey([':', 'k'], function (ev, arg) {
  ext.exec("bmany-list-bookmarks-with-keyword", arg, ev);
}, "bmany - List bookmarks with keyword");

key.setViewKey([':', 't'], function (ev, arg) {
  ext.exec("bmany-list-bookmarks-with-tag", arg, ev);
}, "bmany - List bookmarks with tag");

key.setViewKey([["C-n"], ["j"]], function (ev) {
  key.generateKey(ev.originalTarget, KeyEvent.DOM_VK_DOWN, true);
}, 'Scroll line down', false);

key.setViewKey([["C-p"], ["k"]], function (ev) {
  key.generateKey(ev.originalTarget, KeyEvent.DOM_VK_UP, true);
}, 'Scroll line up', false);

key.setViewKey([["C-f"], ["."]], function (ev) {
  key.generateKey(ev.originalTarget, KeyEvent.DOM_VK_RIGHT, true);
}, 'Scroll right', false);

key.setViewKey([["C-b"], [","]], function (ev) {
  key.generateKey(ev.originalTarget, KeyEvent.DOM_VK_LEFT, true);
}, 'Scroll left', false);

key.setViewKey([["M-v"], ["b"]], function (ev) {
  goDoCommand("cmd_scrollPageUp");
}, 'Scroll page up', false);

key.setViewKey('C-v', function (ev) {
  goDoCommand("cmd_scrollPageDown");
}, 'Scroll page down', false);

key.setViewKey('l', function (ev) {
  getBrowser().mTabContainer.advanceSelectedTab(1, true);
}, 'Select next tab', false);

key.setViewKey('h', function (ev) {
  getBrowser().mTabContainer.advanceSelectedTab(-1, true);
}, 'Select previous tab', false);

key.setViewKey(':', function (ev, arg) {
  shell.input(null, arg);
}, 'List and execute commands', true);

key.setViewKey('C-r', function (ev) {
  BrowserReload();
}, 'Reload the page', true);

key.setViewKey('B', function (ev) {
  BrowserBack();
}, 'Back', false);

key.setViewKey('F', function (ev) {
  BrowserForward();
}, 'Forward', false);

key.setViewKey(["C-x", "h"], function (ev) {
  goDoCommand("cmd_selectAll");
}, 'Select all', true);

key.setViewKey('f', function (ev) {
  command.focusElement(command.elementsRetrieverTextarea, 0);
}, 'Focus to the first textarea', true);

key.setViewKey('e', function (aEvent, aArg) {
  ext.exec("hok-start-foreground-mode", aArg);
}, 'Hok - Foreground hint mode', true);

key.setViewKey('E', function (aEvent, aArg) {
  ext.exec("hok-start-background-mode", aArg);
}, 'HoK - Background hint mode', true);

key.setViewKey(';', function (aEvent, aArg) {
  ext.exec("hok-start-extended-mode", aArg);
}, 'HoK - Extented hint mode', true);

key.setViewKey(['C-c', 'C-e'], function (aEvent, aArg) {
  ext.exec("hok-start-continuous-mode", aArg);
}, 'Start continuous HaH', true);

key.setViewKey('c', function (aEvent, aArg) {
  ext.exec("hok-yank-foreground-mode", aArg);
}, 'Hok - Foreground yank hint mode', true);

key.setViewKey('C-/', function () {
    undoCloseTab();
}, 'Undo close tab');

// caret
key.setCaretKey([["C-a"], ["^"]], function (ev) {
  ev.target.ksMarked ? goDoCommand("cmd_selectBeginLine") : goDoCommand("cmd_beginLine");
}, 'Move caret to the beginning of the line', false);

key.setCaretKey([["C-e"], ["$"]], function (ev) {
  ev.target.ksMarked ? goDoCommand("cmd_selectEndLine") : goDoCommand("cmd_endLine");
}, 'Move caret to the end of the line', false);

key.setCaretKey([["C-n"], ["j"]], function (ev) {
  ev.target.ksMarked ? goDoCommand("cmd_selectLineNext") : goDoCommand("cmd_scrollLineDown");
}, 'Move caret to the next line', false);

key.setCaretKey([["C-p"], ["k"]], function (ev) {
  ev.target.ksMarked ? goDoCommand("cmd_selectLinePrevious") : goDoCommand("cmd_scrollLineUp");
}, 'Move caret to the previous line', false);

key.setCaretKey([["C-f"], ["l"]], function (ev) {
  ev.target.ksMarked ? goDoCommand("cmd_selectCharNext") : goDoCommand("cmd_scrollRight");
}, 'Move caret to the right', false);

key.setCaretKey([["C-b"], ["h"], ["C-h"]], function (ev) {
  ev.target.ksMarked ? goDoCommand("cmd_selectCharPrevious") : goDoCommand("cmd_scrollLeft");
}, 'Move caret to the left', false);

key.setCaretKey([["M-f"], ["w"]], function (ev) {
  ev.target.ksMarked ? goDoCommand("cmd_selectWordNext") : goDoCommand("cmd_wordNext");
}, 'Move caret to the right by word', false);

key.setCaretKey([["C-v"], ["SPC"]], function (ev) {
  ev.target.ksMarked ? goDoCommand("cmd_selectPageNext") : goDoCommand("cmd_movePageDown");
}, 'Move caret down by page', false);

key.setCaretKey([["M-v"], ["b"]], function (ev) {
  ev.target.ksMarked ? goDoCommand("cmd_selectPagePrevious") : goDoCommand("cmd_movePageUp");
}, 'Move caret up by page', false);

key.setCaretKey('J', function (ev) {
  util.getSelectionController().scrollLine(true);
}, 'Scroll line down', false);

key.setCaretKey('K', function (ev) {
  util.getSelectionController().scrollLine(false);
}, 'Scroll line up', false);

key.setCaretKey([["C-SPC"], ["C-@"]], function (ev) {
  command.setMark(ev);
}, 'Set the mark', true);

key.setCaretKey(':', function (ev, arg) {
  shell.input(null, arg);
}, 'List and execute commands', true);

key.setCaretKey('C-r', function (ev) {
  BrowserReload();
}, 'Reload the page', true);

key.setCaretKey('B', function (ev) {
  BrowserBack();
}, 'Back', false);

key.setCaretKey('F', function (ev) {
  BrowserForward();
}, 'Forward', false);

key.setCaretKey(["C-x", "h"], function (ev) {
  goDoCommand("cmd_selectAll");
}, 'Select all', true);

key.setCaretKey('f', function (ev) {
  command.focusElement(command.elementsRetrieverTextarea, 0);
}, 'Focus to the first textarea', true);
