


import time

last_id = 0

class Note:


    def __init__(self, memo, tags=''):
        self.memo = memo
        self.tags = tags
        self.creation_date = time.time()
        global last_id
        last_id += 1
        self.id = last_id


    def match(self, filters):
        return filters in self.tags or filters in self.memo


class NoteBooks:

    def __init__(self):
        self.notes = []

    def new_notes(self, memo, tags=''):
        self.notes.append(Note(memo, tags))

    def modify_tags(self, note_id, tags):
        for n in self.notes:
            if n.id == note_id:
                n.tags = tags
                break

    def lookin
        return [n for n in self.notes if n.match(kw)]

    def _find_note(self, note_id):
        for n in self.notes:
            if n.id == note_id:
                return n
    
    def modify_memo(self, note_id, memo):
        self._find_note(self, note_id).memo = memo
