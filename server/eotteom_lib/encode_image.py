import base64

class Base64Encoding():
    def encoding_image(instance):
        if instance.image != None and instance.image != '':
            with open(f'media/{instance.image.name}', mode='rb') as loadedfile:
                return base64.b64encode(loadedfile.read())
        else:
            return