﻿using SneakerResaleStore.Application.Uploads;
using SneakerResaleStore.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SneakerResaleStore.Implementation.Uploads
{
    public class Base64FileUploader : IBase64FileUploader
    {
        private List<string> _allowedExtensions = new List<string>
        {
            "jpg", "png"
        };

        private Dictionary<UploadType, List<string>> _uploadPaths =
            new Dictionary<UploadType, List<string>>
            {
                {UploadType.BrandLogo, new List<string> {"wwwroot", "images", "brands"} },
                {UploadType.SneakerImage, new List<string> {"wwwroot", "images", "sneakers"} }
            };
        public string Upload(string base64File, UploadType type)
        {
            var extension = base64File.GetFileExtension();

            if (!_allowedExtensions.Contains(extension))
            {
                throw new InvalidOperationException("Unspported file extension.");
            }

            var path = GetPath(type, extension);

            System.IO.File.WriteAllBytes(path, Convert.FromBase64String(base64File));

            return path;
        }

        private string GetPath(UploadType type, string ext)
        {
            var path = _uploadPaths[type];

            var fileName = "";

            foreach (var pathItem in path)
            {
                fileName = Path.Combine(fileName, pathItem);
            }

            return Path.Combine(fileName, Guid.NewGuid().ToString() + "." + ext);
        }
        public IEnumerable<string> Upload(IEnumerable<string> base64Files, UploadType type)
        {
            List<string> uploadedFiles = new List<string>();

            foreach (var file in base64Files)
            {

                uploadedFiles.Add(Upload(file, type));
            }

            return uploadedFiles;
        }

        public string GetExtension(string base64File)
        {
            return base64File.GetFileExtension();
        }

        public bool IsExtensionValid(string base64File)
        {
            return _allowedExtensions.Contains(GetExtension(base64File));
        }
      
    }
}