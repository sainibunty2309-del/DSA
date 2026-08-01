class Solution(object):
    def groupAnagrams(self, strs):
        d = {}

        for word in strs:
            key = "".join(sorted(word))

            if key in d:
                d[key].append(word)
            else:
                d[key] = [word]

        ans = []

        for value in d.values():
            ans.append(value)

        return ans       