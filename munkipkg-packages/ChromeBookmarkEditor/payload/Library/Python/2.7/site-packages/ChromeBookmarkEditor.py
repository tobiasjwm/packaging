#!/usr/bin/python

# Hide python rocket ship from popping up in Dock when run.
import AppKit
info = AppKit.NSBundle.mainBundle().infoDictionary()
info['CFBundleIconFile'] = u'PythonApplet.icns'
info['LSUIElement'] = True

from ScriptingBridge import SBApplication

class ChromeApp(object):

	def __init__(self):
		self.chrome  = SBApplication.applicationWithBundleIdentifier_("com.google.Chrome")

class Chrome(ChromeApp):

	def __init__(self):
		super(Chrome, self).__init__()
		self.bookmarksBar   = Folder(self.chrome.bookmarksBar())
		self.otherBookmarks = Folder(self.chrome.otherBookmarks())

class Folder(ChromeApp):

	def __init__(self, root):
		super(Folder, self).__init__()
		self.root      = root
		self.folders   = self.root.bookmarkFolders()
		self.bookmarks = self.root.bookmarkItems()

	def title(self):
		return self.root.title()

	def setTitle_(self, title):
		self.root.setTitle_(title)

	def delete(self):
		self.root.delete()

	def getFolder(self, title):
		for folder in self.folders:
			if str(folder.title()) == title:
				return Folder(folder)
		return None

	def getBookmark(self, title):
		for bookmark in self.bookmarks:
			if str(bookmark.title()) == title:
				return bookmark
		return None

	def addFolder(self, title):
		properties = dict(
			title=title
		)
		new_folder = self.chrome.classForScriptingClass_("bookmark folder").alloc().initWithProperties_(properties)
		self.folders.append(new_folder)

	def addBookmark(self, title, url):
		properties = dict(
			title=title,
			URL=url
		)
		new_bookmark = self.chrome.classForScriptingClass_("bookmark item").alloc().initWithProperties_(properties)
		self.bookmarks.append(new_bookmark)

	def removeAll(self):
		for item in (self.folders + self.bookmarks):
			item.delete()






