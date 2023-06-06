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

    def my_zip(*args)
        arr = []
           
            self.length.times do |i|
            
                subarr = [self[i]]
                args.my_each do |arg|
                    if i < arg.length
                        subarr << arg[i]
                    else
                        subarr << nil
                    end
                end
                arr << subarr
            end
        arr
    end

    
    # def my_zip(*args)
    #     arr = []
        
    #     self.my_each do |ele|
    #         arr << [ele]
    #     end
        
    #     args.each do |arg|
    #         arg.each_with_index do |ele, i|
    #             if arg[i].length < self.length
    #                 arr[i] << ele
    #             # else
    #             #     arr[i] << nil
    #             end
    #         end
    #     end
        
    #     arr
    # end
end

[[1], [2], [3]]
a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
