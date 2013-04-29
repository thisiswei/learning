import sys
from notebook import Notebook, Note

class Menu:
    def __init__(self):
        self.notebook = Notebook()
        self.choices = {
                "1": self.show_notes,
                "2": self.search_notes,
                "3": self.add_note,
                "4": self.modify_note,
                "5": self.quit
                }

    def display_menu(self):
        print ("""
                 Notebook Menu 
                   1. Show all Notes
                   2. Search Notes
                   3. Add Note
                   4. Modify Note
                   5. Quit """)

    def run(self):
        while True:
            self.display_menu()
            choice = input("enter an option: ")
            action = self.choice.get(choice)
            if action:
                action()
            else:
                print ("{0} is not a not valid".format(choice))

    def show_notes(self, notes=None):
        if not notes:
            notes = self.notebook.notes
        for note in notes:
            print ("%d: %s\n%s", % (note.id, note.tags, note.memo))

    def search_notes(self):
        title = input("search for: ")
        notes = self.notebook.lookin(title)
        self.show_notes(notes)


    def add_notes(self):
        memo = input("Enter a memo: ")
        self.notebook.new_note(memo)
        print ("you note added. ")

    def modify_note(self):
        id = input("enter note id: ")
        memo = input("enter a memo: ")
        tags = input("enter tags: ")
        if memo:
            self.notebook.modify_memo(id, memo)
        if tags:
            self.notebook.modify_tags(id, tags)


    def quit(self):
        print ("thanks! ")
        sys.exit(0)


if __name__ == "__main__":
    Menu().run()

