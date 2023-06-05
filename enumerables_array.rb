class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        arr = []
        self.my_each do |ele| #if self.my_each(&prc) == true
            if prc.call(ele) == true
                arr << ele
            end
        end
        arr
    end

    def my_reject(&prc)
        arr = []
        self.my_each do |ele|
            if prc.call(ele) == false
                arr << ele
            end
        end
        arr
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)  
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if prc.call(ele) == false
        end
        true
    end
    def my_flatten
        array = []
        self.my_each do |ele|
            if ele.is_a?(Array)
                array += ele.my_flatten
            else
                array << ele
            end
        end
        array
    end

end

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
