//
//  PrendaSubCategoria.m
//  DressApp
//
//  Created by Javier Sanchez Sierra on 11/22/11.
//  Copyright (c) 2011 Javier Sanchez Sierra. All rights reserved.
//
// This file is part of DressApp.

// DressApp is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// DressApp is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
//
// Permission is hereby granted, free of charge, to any person obtaining 
// a copy of this software and associated documentation files (the "Software"), 
// to deal in the Software without restriction, including without limitation the 
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or 
// sell copies of the Software, and to permit persons to whom the Software is furnished 
// to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

//https://github.com/jsanchezsierra/DressApp


#import "PrendaSubCategoria.h"
#import "Prenda.h"
#import "PrendaCategoria.h"


@implementation PrendaSubCategoria

@dynamic descripcion;
@dynamic idSubcategoria;
@dynamic orden;
@dynamic categoria;
@dynamic prenda;
@dynamic categoriaID;

+ (PrendaSubCategoria *) subCategoriaWithID:(NSString*)_subCategoriaID withDescripcion:(NSString *)_subCategoriaDescripcion andCategoria:(PrendaCategoria*)_categoria withOrder:(NSInteger)_orden inManagedObjectContext:(NSManagedObjectContext *)context
{
    PrendaSubCategoria *prendaSubCategoria = nil;
	
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	request.entity = [NSEntityDescription entityForName:@"PrendaSubCategoria" inManagedObjectContext:context];
	request.predicate =[NSPredicate
                        predicateWithFormat:@"(idSubcategoria == %@) AND (categoria == %@)",_subCategoriaID,_categoria];
    
	NSError *error = nil;
	prendaSubCategoria = [[context executeFetchRequest:request error:&error] lastObject];
    
	if (!error && !prendaSubCategoria) {
		prendaSubCategoria = [NSEntityDescription insertNewObjectForEntityForName:@"PrendaSubCategoria" inManagedObjectContext:context];
		prendaSubCategoria.idSubcategoria =_subCategoriaID;
		prendaSubCategoria.descripcion =_subCategoriaDescripcion;
        prendaSubCategoria.orden=[NSNumber numberWithInt:_orden];
        prendaSubCategoria.categoria=_categoria;
        prendaSubCategoria.categoriaID=_categoria.idCategoria;
	}else if(prendaSubCategoria)
    {
        prendaSubCategoria.descripcion =_subCategoriaDescripcion;
    }
    
	return prendaSubCategoria;
    
}



@end
