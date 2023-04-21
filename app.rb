require './book'
require './person'
require './decorator'
require './rental'
require './student'
require './teacher'
require './classroom'

class = App
    def initialize 
        @classroom =[]
        @book =[]
        @rental =[]
        @people =[]
    end