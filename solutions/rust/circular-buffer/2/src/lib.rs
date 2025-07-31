pub struct CircularBuffer<T> {
    capacity: usize,
    items: Vec<Option<T>>,
    read_index: usize,
    write_index: usize,
}

#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    EmptyBuffer,
    FullBuffer,
}

impl<T: Clone> CircularBuffer<T> {
    pub fn new(capacity: usize) -> Self {
        Self {
            capacity,
            items: vec![None; capacity],
            read_index: 0,
            write_index: 0,
        }
    }

    pub fn write(&mut self, _element: T) -> Result<(), Error> {
        match self.items[self.write_index] {
            Some(_) => Err(Error::FullBuffer),
            None => {
                self.items[self.write_index] = Some(_element);
                self.increment_write_index();
                Ok(())
            }
        }
    }

    /// Reads the oldest element from the buffer, or error if the buffer is empty
    pub fn read(&mut self) -> Result<T, Error> {
        match self.items[self.read_index].take() {
            Some(item) => {
                self.increment_read_index();
                Ok(item)
            }
            None => Err(Error::EmptyBuffer),
        }
    }

    pub fn clear(&mut self) {
        self.items.iter_mut().for_each(|item| {
            item.take();
        });
        self.read_index = 0;
        self.write_index = 0;
    }

    pub fn overwrite(&mut self, _element: T) {
        match self.items[self.write_index] {
            Some(_) => {
                self.items[self.write_index] = Some(_element);
                self.increment_read_index();
                self.increment_write_index();
            }
            None => {
                self.items[self.write_index] = Some(_element);
            }
        }
    }

    fn increment_read_index(&mut self) {
        self.read_index += 1;

        if self.read_index == self.capacity {
            self.read_index = 0;
        }
    }

    fn increment_write_index(&mut self) {
        self.write_index += 1;

        if self.write_index == self.capacity {
            self.write_index = 0;
        }
    }
}
