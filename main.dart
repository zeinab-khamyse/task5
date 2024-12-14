class Book {
  String title;
  String author;

  Book(this.title, this.author);

  String toString() {
    return '$title by $author';
  }
}

class Member {
  String name;
  String membershipNumber;
  List<Book> borrowedBooks = [];
  Member(this.name, this.membershipNumber);
  void borrowBook(Book book) {
    borrowedBooks.add(book);
    print('$name borrowed "${book.title}".');
  }

  void returnBook(Book book) {
    if (borrowedBooks.contains(book)) {
      borrowedBooks.remove(book);
      print('$name returned "${book.title}".');
    } else {
      print('$name has not borrowed "${book.title}".');
    }
  }

  void printMemberInfo() {
    print('Member Name: $name');
    print('Membership Number: $membershipNumber');
    print('Borrowed Books:');
    if (borrowedBooks.isEmpty) {
      print('No books borrowed.');
    } else {
      for (Book book in borrowedBooks) {
        print('- ${book.title} by ${book.author}');
      }
    }
  }
}

void main() {
  Book book1 = Book('Dart for Beginners', 'John Doe');
  Book book2 = Book('Flutter in Action', 'Jane Smith');
  Book book3 = Book('Programming with Dart', 'Alice Brown');

  Member alice = Member('Alice', 'M001');
  Member bob = Member('Bob', 'M002');

  alice.borrowBook(book1);
  alice.borrowBook(book2);
  bob.borrowBook(book3);
  print('\nBefore returning books:');
  alice.printMemberInfo();
  bob.printMemberInfo();

  // Alice returns a book
  alice.returnBook(book1);

  // Print member info after returning books
  print('\nAfter returning books:');
  alice.printMemberInfo();
}
