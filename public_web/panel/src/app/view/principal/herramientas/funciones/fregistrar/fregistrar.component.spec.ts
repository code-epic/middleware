import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FregistrarComponent } from './fregistrar.component';

describe('FregistrarComponent', () => {
  let component: FregistrarComponent;
  let fixture: ComponentFixture<FregistrarComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FregistrarComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FregistrarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
