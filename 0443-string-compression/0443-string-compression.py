class Solution(object):
    def compress(self, chars):
        i = 0
        index = 0

        while i<len(chars):
            ch = chars[i]
            count = 0

            while i<len(chars) and chars[i]==ch:
                i +=1
                count +=1

            chars[index]=ch
            index +=1

            if count >1:
                for digit in str(count):
                    chars[index] = digit
                    index +=1

        return index